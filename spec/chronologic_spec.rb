require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Chronologic" do
  it "should load the proper jar files" do
    org.apache.lucene.should_not == nil
  end
end