require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/index.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:messages] = [
      stub_model(Messages,
        :from => "value for from",
        :to => "value for to",
        :subject => "value for subject",
        :body => "value for body"
      ),
      stub_model(Messages,
        :from => "value for from",
        :to => "value for to",
        :subject => "value for subject",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of messages" do
    render
    response.should have_tag("tr>td", "value for from".to_s, 2)
    response.should have_tag("tr>td", "value for to".to_s, 2)
    response.should have_tag("tr>td", "value for subject".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end
