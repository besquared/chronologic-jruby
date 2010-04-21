require File.join(File.dirname(__FILE__), 'spec_helper')

describe Chronologic::Timeline do
  before(:each) do
    @event = {:id => 1, :created_at => Time.now.utc.to_i}
  end
  
  it "should append an event" do
    registrations = Chronologic::Timeline.new('sessions')
    registrations.append(1, @event)
  end
  
  it "should sample a set of events" do
    
  end
end