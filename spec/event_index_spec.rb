require File.join(File.dirname(__FILE__), 'spec_helper')

describe Chronologic::EventIndex do
  before(:each) do
    @event = {:id => 1, :created_at => Time.now.utc.to_i}
  end
  
  it "should insert an event" do
    index = Chronologic::EventIndex.new('registrations')
    index.insert(@event).should == true
  end
  
  it "should sample all events" do
    index = Chronologic::EventIndex::new('registrations')
    
    100.times do |num|
      index.insert(@event.merge(:id => num))
    end
    
    puts index.sample("").inspect
  end
end