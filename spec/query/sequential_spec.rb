require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Query::Sequential do
  before(:each) do
    recreate_index!('sessions')
    recreate_index!('registrations')
    
    load_sessions_data
    load_registrations_data
  end
  
  it "should perform a simple query" do
    query = Chronologic::Query::Sequential.new('registrations', :cluster_by => 'user_id')
    query.timeline.should == 'registrations'
    query.cluster_by.should == 'user_id'
  end  
end