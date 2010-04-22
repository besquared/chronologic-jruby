module Chronologic
  module CohortAnalysis
    attr_accessor :period
    
    class RollingAnalyzer(period = 14.days)
      @period = period
    end
    
    # uses an event in a separate base table as
    #  the cohort grouping and an event in second table 
    #  to calculate the follow up activity
    def occurence(base_table, activity_table, object_id, query = {}, options = {})
      base_timeline = Timeline.new(base_table)
      activity_timeline = Timeline.new(activity_table)
      
      firsts = base_timeline.sample(query, :size => options[:size] || 1000)
      
      object_ids = samples.collect{|sample| sample[object_id]}          
      follow_ups = activity_timeline.sample("#{query} #{object_id}:(#{object_ids.join(' ')})")
    end
  end
end