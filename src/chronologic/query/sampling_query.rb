module Chronologic
  module Query
    class SamplingQuery
      attr_accessor :name
      attr_accessor :joins
      attr_accessor :sequence_group_by
      
      def initialize(name)
        @name = name
        @joins = []
      end
      
      def left_join(timeline, left_attribute, right_attribute)
        joins << LeftJoin.new(timeline, left_attribute, right_attribute)
        self
      end
      
      def sequence_group_by(name)
        @sequence_group_by = name
        self
      end
      
      # cascading sampling we need to make sure
      #  we know exactly how many hits were in each join
      def sequence(query = "", options = {}, &block)
        # cohorts: registrations left join activities on registration.user_id = activities.user_id, 
        #             sequence group by user_id
        
        # base_timeline = Timeline.new(base_table)
        # activity_timeline = Timeline.new(activity_table)
        # 
        # firsts = base_timeline.sample(query, :size => options[:size] || 1000)
        # 
        # object_ids = samples.collect{|sample| sample[object_id]}          
        # follow_ups = activity_timeline.sample("#{query} #{object_id}:(#{object_ids.join(' ')})")
      end
    end
  end
end