require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/show.html.erb" do
  include MessagesHelper
  before(:each) do
    assigns[:messages] = @messages = stub_model(Messages,
      :from => "value for from",
      :to => "value for to",
      :subject => "value for subject",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ from/)
    response.should have_text(/value\ for\ to/)
    response.should have_text(/value\ for\ subject/)
    response.should have_text(/value\ for\ body/)
  end
end
