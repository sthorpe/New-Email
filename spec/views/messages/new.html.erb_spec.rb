require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/new.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:messages] = stub_model(Messages,
      :new_record? => true,
      :from => "value for from",
      :to => "value for to",
      :subject => "value for subject",
      :body => "value for body"
    )
  end

  it "renders new messages form" do
    render

    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("input#messages_from[name=?]", "messages[from]")
      with_tag("input#messages_to[name=?]", "messages[to]")
      with_tag("input#messages_subject[name=?]", "messages[subject]")
      with_tag("input#messages_body[name=?]", "messages[body]")
    end
  end
end
