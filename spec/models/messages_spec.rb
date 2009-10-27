require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Messages do
  before(:each) do
    @valid_attributes = {
      :from => "value for from",
      :to => "value for to",
      :subject => "value for subject",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    Messages.create!(@valid_attributes)
  end
end
