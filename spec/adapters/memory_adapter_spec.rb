require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Adapters::MemoryAdapter do
  it "should create, find and destroy data" do
    store = Chronologic::Adapters::MemoryAdapter.new
    
    store.create('sessions', 1, {:name => 'Josh'})
    store.find('sessions', 1).should == {:name => 'Josh'}
    store.destroy('sessions', 1)
    store.find('sessions', 1).should == nil
  end
end