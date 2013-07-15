require "spec_helper"

describe PlayingsController do
  describe "routing" do

    it "routes to #index" do
      get("/playings").should route_to("playings#index")
    end

    it "routes to #new" do
      get("/playings/new").should route_to("playings#new")
    end

    it "routes to #show" do
      get("/playings/1").should route_to("playings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/playings/1/edit").should route_to("playings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/playings").should route_to("playings#create")
    end

    it "routes to #update" do
      put("/playings/1").should route_to("playings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/playings/1").should route_to("playings#destroy", :id => "1")
    end

  end
end
