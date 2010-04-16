require File.join(File.dirname(__FILE__), 'spec_helper')

describe Chronologic::EventIndex do
  before(:each) do
    
  end
  
  it "should insert an event" do
    event = {:created_at => Time.now.utc.to_i}
    index = Chronologic::EventIndex.new('registrations')
    index.insert(event)
  end
end