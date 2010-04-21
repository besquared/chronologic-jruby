require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Adapters::MemoryAdapter do
  it "should create, find and destroy data" do
    store = Chronologic::Adapters::MemoryAdapter.new
    
    store.create(1, {:name => 'Josh'})
    store.find(1).should == {:name => 'Josh'}
    store.destroy(1)
    store.find(1).should == nil
  end
end