require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/edit.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:messages] = @messages = stub_model(Messages,
      :new_record? => false,
      :from => "value for from",
      :to => "value for to",
      :subject => "value for subject",
      :body => "value for body"
    )
  end

  it "renders the edit messages form" do
    render

    response.should have_tag("form[action=#{messages_path(@messages)}][method=post]") do
      with_tag('input#messages_from[name=?]', "messages[from]")
      with_tag('input#messages_to[name=?]', "messages[to]")
      with_tag('input#messages_subject[name=?]', "messages[subject]")
      with_tag('input#messages_body[name=?]', "messages[body]")
    end
  end
end
