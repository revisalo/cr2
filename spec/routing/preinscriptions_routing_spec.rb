require "spec_helper"

describe PreinscriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/preinscriptions").should route_to("preinscriptions#index")
    end

    it "routes to #new" do
      get("/preinscriptions/new").should route_to("preinscriptions#new")
    end

    it "routes to #show" do
      get("/preinscriptions/1").should route_to("preinscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/preinscriptions/1/edit").should route_to("preinscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/preinscriptions").should route_to("preinscriptions#create")
    end

    it "routes to #update" do
      put("/preinscriptions/1").should route_to("preinscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/preinscriptions/1").should route_to("preinscriptions#destroy", :id => "1")
    end

  end
end
