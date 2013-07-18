require 'spec_helper'

describe TictactoeMovesController do

  # This should return the minimal set of attributes required to create a valid
  # TictactoeMove. As you add validations to TictactoeMove, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TictactoeMovesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all tictactoe_moves as @tictactoe_moves" do
      tictactoe_move = TictactoeMove.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tictactoe_moves).should eq([tictactoe_move])
    end
  end

  describe "GET show" do
    it "assigns the requested tictactoe_move as @tictactoe_move" do
      tictactoe_move = TictactoeMove.create! valid_attributes
      get :show, {:id => tictactoe_move.to_param}, valid_session
      assigns(:tictactoe_move).should eq(tictactoe_move)
    end
  end

  describe "GET new" do
    it "assigns a new tictactoe_move as @tictactoe_move" do
      get :new, {}, valid_session
      assigns(:tictactoe_move).should be_a_new(TictactoeMove)
    end
  end

  describe "GET edit" do
    it "assigns the requested tictactoe_move as @tictactoe_move" do
      tictactoe_move = TictactoeMove.create! valid_attributes
      get :edit, {:id => tictactoe_move.to_param}, valid_session
      assigns(:tictactoe_move).should eq(tictactoe_move)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TictactoeMove" do
        expect {
          post :create, {:tictactoe_move => valid_attributes}, valid_session
        }.to change(TictactoeMove, :count).by(1)
      end

      it "assigns a newly created tictactoe_move as @tictactoe_move" do
        post :create, {:tictactoe_move => valid_attributes}, valid_session
        assigns(:tictactoe_move).should be_a(TictactoeMove)
        assigns(:tictactoe_move).should be_persisted
      end

      it "redirects to the created tictactoe_move" do
        post :create, {:tictactoe_move => valid_attributes}, valid_session
        response.should redirect_to(TictactoeMove.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tictactoe_move as @tictactoe_move" do
        # Trigger the behavior that occurs when invalid params are submitted
        TictactoeMove.any_instance.stub(:save).and_return(false)
        post :create, {:tictactoe_move => {}}, valid_session
        assigns(:tictactoe_move).should be_a_new(TictactoeMove)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TictactoeMove.any_instance.stub(:save).and_return(false)
        post :create, {:tictactoe_move => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tictactoe_move" do
        tictactoe_move = TictactoeMove.create! valid_attributes
        # Assuming there are no other tictactoe_moves in the database, this
        # specifies that the TictactoeMove created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TictactoeMove.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => tictactoe_move.to_param, :tictactoe_move => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested tictactoe_move as @tictactoe_move" do
        tictactoe_move = TictactoeMove.create! valid_attributes
        put :update, {:id => tictactoe_move.to_param, :tictactoe_move => valid_attributes}, valid_session
        assigns(:tictactoe_move).should eq(tictactoe_move)
      end

      it "redirects to the tictactoe_move" do
        tictactoe_move = TictactoeMove.create! valid_attributes
        put :update, {:id => tictactoe_move.to_param, :tictactoe_move => valid_attributes}, valid_session
        response.should redirect_to(tictactoe_move)
      end
    end

    describe "with invalid params" do
      it "assigns the tictactoe_move as @tictactoe_move" do
        tictactoe_move = TictactoeMove.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TictactoeMove.any_instance.stub(:save).and_return(false)
        put :update, {:id => tictactoe_move.to_param, :tictactoe_move => {}}, valid_session
        assigns(:tictactoe_move).should eq(tictactoe_move)
      end

      it "re-renders the 'edit' template" do
        tictactoe_move = TictactoeMove.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TictactoeMove.any_instance.stub(:save).and_return(false)
        put :update, {:id => tictactoe_move.to_param, :tictactoe_move => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tictactoe_move" do
      tictactoe_move = TictactoeMove.create! valid_attributes
      expect {
        delete :destroy, {:id => tictactoe_move.to_param}, valid_session
      }.to change(TictactoeMove, :count).by(-1)
    end

    it "redirects to the tictactoe_moves list" do
      tictactoe_move = TictactoeMove.create! valid_attributes
      delete :destroy, {:id => tictactoe_move.to_param}, valid_session
      response.should redirect_to(tictactoe_moves_url)
    end
  end

end
