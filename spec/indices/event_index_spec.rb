require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Indices::EventIndex do
  before(:each) do
    @event = Chronologic::Indices::EventDocument.new
    @event.add('id', 1, true)
    @event.add('occurred_at', Time.now.utc.to_i, true)
  end
  
  it "should insert an event" do
    index = Chronologic::Indices::EventIndex.new('registrations')
    index.insert(@event)
  end
  
  it "should sample all events" do
    index = Chronologic::Indices::EventIndex::new('registrations')
    
    events = []
    20.times do |num|
      event = Chronologic::Indices::EventDocument.new
      event.add('id', num, true)
      event.add('occurred_at', Time.now.utc.to_i, true)
      events << event
    end
    index.load(events)
    
    index.sample(:size => 15).size.should == 15
  end
end