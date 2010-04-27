module Chronologic
  module Indices
    class EventIndex < BaseIndex
      attr_accessor :name
      attr_accessor :lucene
    
      def initialize(name)
        @name = name
        @lucene = org.apache.lucene
      end
    
      #
      # Core Functions
      #
      
      def insert(event = {})
        load([event])
      end
    
      def load(events = [])
        index = lucene.index.IndexWriter.new(directory, analyzer, !exists?, max_field_length)
        
        begin      
          events.each do |event|
            event.add('random_key', rand, false)
            document = lucene.document.Document.new

            event.each do |field|
              document.add(
                lucene.document.Field.new(
                  field.name.to_s, field.value.to_s, field.stored, field.analyzed
                )
              )
            end
        
            index.add_document(document)
          end
          
          index.close
        rescue Exception => e
          index.close
          throw e
        end
      end
      
      def sample(options = {:query => '', :size => 10})
        searcher = lucene.search.IndexSearcher.new(directory);
      
        if options[:query].nil? or options[:query].empty?
          query = lucene.search.MatchAllDocsQuery.new
        else
          parser = lucene.queryParser.QueryParser.new(lucene_version, "created_at", analyzer);
          query = parser.parse(options[:query]);
        end
      
        sort = lucene.search.Sort.new(random_sort_field)        
        top_docs = searcher.search(query, nil, options[:size], sort)
        
        hits = top_docs.scoreDocs
        total_hits = top_docs.totalHits
        
        events = []
        0.upto(hits.length - 1) do |doc_num|
          events << IndexedEvent.new(searcher.doc(hits[doc_num].doc))
        end
      
        searcher.close
      
        Sample.new(events, events.length, total_hits)
      end
      
      #
      # Utility Functions
      #
      
      def recreate!
        lucene.index.IndexWriter.new(directory, analyzer, true, max_field_length).close
      end
    end
  end
end