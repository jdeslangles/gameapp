require 'spec_helper'

describe PlayingsController do

  # This should return the minimal set of attributes required to create a valid
  # Playing. As you add validations to Playing, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlayingsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all playings as @playings" do
      playing = Playing.create! valid_attributes
      get :index, {}, valid_session
      assigns(:playings).should eq([playing])
    end
  end

  describe "GET show" do
    it "assigns the requested playing as @playing" do
      playing = Playing.create! valid_attributes
      get :show, {:id => playing.to_param}, valid_session
      assigns(:playing).should eq(playing)
    end
  end

  describe "GET new" do
    it "assigns a new playing as @playing" do
      get :new, {}, valid_session
      assigns(:playing).should be_a_new(Playing)
    end
  end

  describe "GET edit" do
    it "assigns the requested playing as @playing" do
      playing = Playing.create! valid_attributes
      get :edit, {:id => playing.to_param}, valid_session
      assigns(:playing).should eq(playing)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Playing" do
        expect {
          post :create, {:playing => valid_attributes}, valid_session
        }.to change(Playing, :count).by(1)
      end

      it "assigns a newly created playing as @playing" do
        post :create, {:playing => valid_attributes}, valid_session
        assigns(:playing).should be_a(Playing)
        assigns(:playing).should be_persisted
      end

      it "redirects to the created playing" do
        post :create, {:playing => valid_attributes}, valid_session
        response.should redirect_to(Playing.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved playing as @playing" do
        # Trigger the behavior that occurs when invalid params are submitted
        Playing.any_instance.stub(:save).and_return(false)
        post :create, {:playing => {}}, valid_session
        assigns(:playing).should be_a_new(Playing)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Playing.any_instance.stub(:save).and_return(false)
        post :create, {:playing => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested playing" do
        playing = Playing.create! valid_attributes
        # Assuming there are no other playings in the database, this
        # specifies that the Playing created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Playing.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => playing.to_param, :playing => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested playing as @playing" do
        playing = Playing.create! valid_attributes
        put :update, {:id => playing.to_param, :playing => valid_attributes}, valid_session
        assigns(:playing).should eq(playing)
      end

      it "redirects to the playing" do
        playing = Playing.create! valid_attributes
        put :update, {:id => playing.to_param, :playing => valid_attributes}, valid_session
        response.should redirect_to(playing)
      end
    end

    describe "with invalid params" do
      it "assigns the playing as @playing" do
        playing = Playing.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Playing.any_instance.stub(:save).and_return(false)
        put :update, {:id => playing.to_param, :playing => {}}, valid_session
        assigns(:playing).should eq(playing)
      end

      it "re-renders the 'edit' template" do
        playing = Playing.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Playing.any_instance.stub(:save).and_return(false)
        put :update, {:id => playing.to_param, :playing => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested playing" do
      playing = Playing.create! valid_attributes
      expect {
        delete :destroy, {:id => playing.to_param}, valid_session
      }.to change(Playing, :count).by(-1)
    end

    it "redirects to the playings list" do
      playing = Playing.create! valid_attributes
      delete :destroy, {:id => playing.to_param}, valid_session
      response.should redirect_to(playings_url)
    end
  end

end
