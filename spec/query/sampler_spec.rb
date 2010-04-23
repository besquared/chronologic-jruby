require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Query::Sampler do
  before(:each) do
    recreate_index!('sessions')
    recreate_index!('registrations')
    
    load_sessions_data
    load_registrations_data
  end
  
  it "should perform a sequential query" do
    query = Chronologic::Query::Sequential.new('registrations')
    sampler = Chronologic::Query::Sampler.new(query)
    sample = sampler.sample
    
    sample.length.should == 2
  end
  
  it "should perform a clustered sequential query" do
    query = Chronologic::Query::Sequential.new('registrations', '', 'user_id')
    sampler = Chronologic::Query::Sampler.new(query)
    sample = sampler.sample

    sample.length.should == 2
    sample.length(1).should == 1
    sample.length(2).should == 1
  end
end