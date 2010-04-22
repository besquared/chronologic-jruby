module Chronologic
  module Functions
    class Cohorts
      class << self
        # need to do fixed cohorts and rolling cohorts
        
        # uses a single table and uses the first
        #  occurrence of an event as the cohort grouping
        def first_occurrence(activity_table, object_id, query = "", options = {})
          activity_timeline = Timeline.new(activity_table)
          firsts = activity_timeline.sample(query, :size => options[:size] || 1000)
          
          object_ids = samples.collect{|sample| sample[object_id]}          
          follow_ups = activity_timeline.sample("#{query} #{object_id}:(#{object_ids.join(' ')})")
        end
        
        # uses an event in a separate base table as
        #  the cohort grouping and an event in second table 
        #  to calculate the follow up activity
        def occurence(base_table, activity_table, object_id, query = {}, options = {})
        end
      end
    end
  end
end