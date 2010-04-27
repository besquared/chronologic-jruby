require File.join(File.dirname(__FILE__), 'spec_helper')

describe Chronologic::Timeline do
  before(:each) do
    recreate_index!('sessions')
    
    @event = Chronologic::Indices::EventDocument.new
    @event.add('event_id', 1, true)
    @event.add('occurred_at', Time.now.utc.to_i, true)
  end
  
  it "should append an event" do
    registrations = Chronologic::Timeline.new('sessions')
    registrations.append(@event)
  end
  
  it "should sample a set of events" do
    registrations = Chronologic::Timeline.new('sessions')
    
    11.times do |i|
      event = Chronologic::Indices::EventDocument.new
      event.add('event_id', i, true)
      event.add('occurred_at', Time.now.utc.to_i, true)
      registrations.append(event)
    end
    
    sample = registrations.sample(:size => 10)
    sample.size.should == 10
  end
end