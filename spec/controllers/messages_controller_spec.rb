require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do

  def mock_messages(stubs={})
    @mock_messages ||= mock_model(Messages, stubs)
  end

  describe "GET index" do
    it "assigns all messages as @messages" do
      Messages.stub!(:find).with(:all).and_return([mock_messages])
      get :index
      assigns[:messages].should == [mock_messages]
    end
  end

  describe "GET show" do
    it "assigns the requested messages as @messages" do
      Messages.stub!(:find).with("37").and_return(mock_messages)
      get :show, :id => "37"
      assigns[:messages].should equal(mock_messages)
    end
  end

  describe "GET new" do
    it "assigns a new messages as @messages" do
      Messages.stub!(:new).and_return(mock_messages)
      get :new
      assigns[:messages].should equal(mock_messages)
    end
  end

  describe "GET edit" do
    it "assigns the requested messages as @messages" do
      Messages.stub!(:find).with("37").and_return(mock_messages)
      get :edit, :id => "37"
      assigns[:messages].should equal(mock_messages)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created messages as @messages" do
        Messages.stub!(:new).with({'these' => 'params'}).and_return(mock_messages(:save => true))
        post :create, :messages => {:these => 'params'}
        assigns[:messages].should equal(mock_messages)
      end

      it "redirects to the created messages" do
        Messages.stub!(:new).and_return(mock_messages(:save => true))
        post :create, :messages => {}
        response.should redirect_to(message_url(mock_messages))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved messages as @messages" do
        Messages.stub!(:new).with({'these' => 'params'}).and_return(mock_messages(:save => false))
        post :create, :messages => {:these => 'params'}
        assigns[:messages].should equal(mock_messages)
      end

      it "re-renders the 'new' template" do
        Messages.stub!(:new).and_return(mock_messages(:save => false))
        post :create, :messages => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested messages" do
        Messages.should_receive(:find).with("37").and_return(mock_messages)
        mock_messages.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :messages => {:these => 'params'}
      end

      it "assigns the requested messages as @messages" do
        Messages.stub!(:find).and_return(mock_messages(:update_attributes => true))
        put :update, :id => "1"
        assigns[:messages].should equal(mock_messages)
      end

      it "redirects to the messages" do
        Messages.stub!(:find).and_return(mock_messages(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(message_url(mock_messages))
      end
    end

    describe "with invalid params" do
      it "updates the requested messages" do
        Messages.should_receive(:find).with("37").and_return(mock_messages)
        mock_messages.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :messages => {:these => 'params'}
      end

      it "assigns the messages as @messages" do
        Messages.stub!(:find).and_return(mock_messages(:update_attributes => false))
        put :update, :id => "1"
        assigns[:messages].should equal(mock_messages)
      end

      it "re-renders the 'edit' template" do
        Messages.stub!(:find).and_return(mock_messages(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested messages" do
      Messages.should_receive(:find).with("37").and_return(mock_messages)
      mock_messages.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the messages list" do
      Messages.stub!(:find).and_return(mock_messages(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(messages_url)
    end
  end

end
