require File.join(File.dirname(__FILE__), 'spec_helper')

describe Chronologic::Configuration do
  it "should have default configure storage" do
    storage = Chronologic::Configuration.storage
    
    storage.should_not == nil
    storage.should be_instance_of(Chronologic::Adapters::MemoryAdapter)
  end
end