require File.join(File.dirname(__FILE__), 'spec_helper')

describe Chronologic::Timeline do
  before(:each) do
    recreate_index!('sessions')
    @event = {:id => 1, :created_at => Time.now.utc.to_i}
  end
  
  it "should append an event" do
    registrations = Chronologic::Timeline.new('sessions')
    registrations.append(1, @event)
  end
  
  it "should sample a set of events" do
    registrations = Chronologic::Timeline.new('sessions')
    
    11.times do |i|
      registrations.append(i, @event)
    end
    
    sample = registrations.sample("", :size => 10)
    sample.length.should == 10
  end
end