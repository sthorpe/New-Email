class MessagesController < ApplicationController
  before_filter :login_required

  def index
    @messages = Message.from_uniq_user(current_user) unless params[:message]

    respond_to do |format|
      if params[:message]
        @message = Message.find_by_id(params[:message])
        format.js { render(:update) { |page|
          page.replace_html 'subjectpadding', :partial => 'message', :locals => {:message => @message}
        }}
      else
        format.html # index.html.erb
        format.xml  { render :xml => @message }
      end
    end
  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])
    @message.sender = current_user.id
    @message.recipient = User.find_by_login(params[:message][:recipient]) ? User.find_by_login(params[:message][:recipient]).id : params[:message][:recipient]
    @message.user_id = current_user.id
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to(@message) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:messages])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
