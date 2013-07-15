require "spec_helper"

describe TictactoeMovesController do
  describe "routing" do

    it "routes to #index" do
      get("/tictactoe_moves").should route_to("tictactoe_moves#index")
    end

    it "routes to #new" do
      get("/tictactoe_moves/new").should route_to("tictactoe_moves#new")
    end

    it "routes to #show" do
      get("/tictactoe_moves/1").should route_to("tictactoe_moves#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tictactoe_moves/1/edit").should route_to("tictactoe_moves#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tictactoe_moves").should route_to("tictactoe_moves#create")
    end

    it "routes to #update" do
      put("/tictactoe_moves/1").should route_to("tictactoe_moves#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tictactoe_moves/1").should route_to("tictactoe_moves#destroy", :id => "1")
    end

  end
end
