require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Indices::EventIndex do
  before(:each) do
    @event = {:id => 1, :created_at => Time.now.utc.to_i}
  end
  
  it "should insert an event" do
    index = Chronologic::Indices::EventIndex.new('registrations')
    index.insert(@event)
  end
  
  it "should sample all events" do
    index = Chronologic::Indices::EventIndex::new('registrations')
    
    events = []
    20.times do |num|
      events << @event.merge(:id => num)
    end
    index.load(events)
    
    index.sample("", :size => 15).sample_size.should == 15
  end
end