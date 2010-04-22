module Chronologic
  module Query
    class SamplingQuery
      attr_accessor :timeline
      attr_accessor :joins
      attr_accessor :group_by
      
      def initialize(timeline)
        @timeline = timeline
        @joins = []
      end
      
      def left_join(timeline, left_attribute, right_attribute, query = "")
        joins << LeftJoin.new(timeline, left_attribute, right_attribute, query)
        self
      end
      
      def group_by(name)
        @group_by = name
        self
      end
      
      # cascading sampling we need to make sure
      #  we know exactly how many hits were in each join
      def sequence(query = "", options = {}, &block)
        # cohorts: registrations left join activities on registration.user_id = activities.user_id, 
        #             sequence group by user_id
        
        results = Sequence.new
        
        base_timeline = Timeline.new(timeline)
        base_sample = base_timeline.sample(query, :size => options[:size] || 1000)
        
        if base_sample.empty?
          return results
        else
          results << base_sample
        end
        
        joins.each do |join|
          right_timeline = Timeline.new(join.timeline)
          object_ids = base_sample.collect{|sample| sample[join.left_attribute]}.compact
          right_sample = right_timeline.sample("#{join.query} #{join.right_attribute}:(#{object_ids.join(' ')})")
          results << right_sample unless right_sample.empty?
        end
        
        results
      end
    end
  end
end