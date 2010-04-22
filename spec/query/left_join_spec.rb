require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Chronologic::Query::LeftJoin do
  it "should initialize" do
    join = Chronologic::Query::LeftJoin.new('sessions', 'user_id', 'user_id')
    
    join.timeline.should == 'sessions'
    join.left_attribute.should == 'user_id'
    join.right_attribute.should == 'user_id'
    join.query.should == ''
  end
end