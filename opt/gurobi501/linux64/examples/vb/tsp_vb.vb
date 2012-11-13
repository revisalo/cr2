' Copyright 2012, Gurobi Optimization, Inc.
'
' Solve a traveling salesman problem on a randomly generated set of
' points using lazy constraints.   The base MIP model only includes
' 'degree-2' constraints, requiring each node to have exactly
' two incident edges.  Solutions to this model may contain subtours -
' tours that don't visit every node.  The lazy constraint callback
' adds new constraints to cut them off.

Imports Gurobi

Class tsp_vb
    Inherits GRBCallback
    Private vars As GRBVar(,)

    Public Sub New(xvars As GRBVar(,))
        vars = xvars
    End Sub

    ' Subtour elimination callback.    Whenever a feasible solution is found,
    ' find the subtour that contains node 0, and add a subtour elimination
    ' constraint if the tour doesn't visit every node.

    Protected Overrides Sub Callback()
        Try
            If where = GRB.Callback.MIPSOL Then
                ' Found an integer feasible solution - does it visit every node?

                Dim n As Integer = vars.GetLength(0)
                Dim tour As Integer() = findsubtour(GetSolution(vars))

                If tour.Length < n Then
                    ' Add subtour elimination constraint
                    Dim expr As GRBLinExpr = 0
                    For i As Integer = 0 To tour.Length - 2
                        expr += vars(tour(i), tour(i + 1))
                    Next
                    expr += vars(tour(tour.Length - 1), tour(0))
                    AddLazy(expr <= tour.Length - 1)
                End If
            End If
        Catch e As GRBException
            Console.WriteLine("Error code: " & e.ErrorCode & ". " & e.Message)
            Console.WriteLine(e.StackTrace)
        End Try
    End Sub

    ' Given an integer-feasible solution 'sol', find the sub-tour that
    ' contains node 0.    Result is returned in 'tour', and length is
    ' returned in 'tourlenP'.

    Protected Shared Function findsubtour(sol As Double(,)) As Integer()
        Dim n As Integer = sol.GetLength(0)
        Dim seen As Boolean() = New Boolean(n - 1) {}
        Dim tour As Integer() = New Integer(n - 1) {}
        Dim i As Integer, index As Integer, node As Integer

        For i = 0 To n - 1
            seen(i) = False
        Next

        node = 0
        For index = 0 To n - 1
            tour(index) = node
            seen(node) = True
            For i = 0 To n - 1
                If sol(node, i) > 0.5 AndAlso Not seen(i) Then
                    node = i
                    Exit For
                End If
            Next
            If i = n Then
                Exit For
            End If
        Next
        System.Array.Resize(tour, index + 1)

        Return tour
    End Function

    ' Euclidean distance between points 'i' and 'j'

    Protected Shared Function distance(x As Double(), y As Double(), i As Integer, j As Integer) As Double
        Dim dx As Double = x(i) - x(j)
        Dim dy As Double = y(i) - y(j)
        Return Math.Sqrt(dx * dx + dy * dy)
    End Function

    Public Shared Sub Main(args As String())

        If args.Length < 1 Then
            Console.WriteLine("Usage: tsp_vb nnodes")
            Return
        End If

        Dim n As Integer = Convert.ToInt32(args(0))

        Try
            Dim env As New GRBEnv()
            Dim model As New GRBModel(env)

            ' Must disable dual reductions when using lazy constraints

            model.GetEnv().Set(GRB.IntParam.DualReductions, 0)

            Dim x As Double() = New Double(n - 1) {}
            Dim y As Double() = New Double(n - 1) {}

            Dim r As New Random()
            For i As Integer = 0 To n - 1
                x(i) = r.NextDouble()
                y(i) = r.NextDouble()
            Next

            ' Create variables

            Dim vars As GRBVar(,) = New GRBVar(n - 1, n - 1) {}

            For i As Integer = 0 To n - 1
                For j As Integer = 0 To n - 1
                    vars(i, j) = model.AddVar(0.0, 1.0, distance(x, y, i, j), GRB.BINARY, "x" & i & "_" & j)
                Next
            Next

            ' Integrate variables

            model.Update()

            ' Degree-2 constraints

            For i As Integer = 0 To n - 1
                Dim expr As GRBLinExpr = 0
                For j As Integer = 0 To n - 1
                    expr += vars(i, j)
                Next
                model.AddConstr(expr = 2.0, "deg2_" & i)
            Next

            ' Forbid edge from node back to itself

            For i As Integer = 0 To n - 1
                vars(i, i).Set(GRB.DoubleAttr.UB, 0.0)
            Next

            ' Symmetric TSP

            For i As Integer = 0 To n - 1
                For j As Integer = 0 To i - 1
                    model.AddConstr(vars(i, j) = vars(j, i), "")
                Next
            Next

            model.SetCallback(New tsp_vb(vars))
            model.Optimize()

            If model.Get(GRB.IntAttr.SolCount) > 0 Then
                Dim tour As Integer() = findsubtour(model.Get(GRB.DoubleAttr.X, vars))

                Console.Write("Tour: ")
                For i As Integer = 0 To tour.Length - 1
                    Console.Write(tour(i) & " ")
                Next
                Console.WriteLine()
            End If

            ' Dispose of model and environment
            model.Dispose()

            env.Dispose()
        Catch e As GRBException
            Console.WriteLine("Error code: " & e.ErrorCode & ". " & e.Message)
            Console.WriteLine(e.StackTrace)
        End Try
    End Sub
End Class
