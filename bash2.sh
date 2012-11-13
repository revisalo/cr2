export GUROBI_HOME="./opt/gurobi501/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE=/home/san/gurobi.lic

/usr/lib/jvm/default-java/jre/bin/java -jar gurobisalo.jar ./files/
