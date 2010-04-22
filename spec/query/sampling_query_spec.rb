require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Query::SamplingQuery do
  before(:each) do
    recreate_index!('sessions')
    recreate_index!('registrations')
    
    load_sessions_data
    load_registrations_data
  end
  
  it "should perform a simple query" do
    query = Chronologic::Query::SamplingQuery.new('registrations')
    puts query.sequence.inspect
  end
  
  it "should perform a join query" do
    query = Chronologic::Query::SamplingQuery.new('registrations')
    query.left_join('sessions', 'user_id', 'user_id')
    puts query.sequence.inspect
  end
end