module Chronologic
  class EventIndex
    attr_accessor :name
    attr_accessor :lucene
    
    def initialize(name)
      @name = name
      @lucene = org.apache.lucene
    end
    
    def insert(event = {})
      load([event])
    end
    
    def load(events = [])
      index = lucene.index.IndexWriter.new(directory, analyzer, !exists?, max_field_length)
      
      events.each do |event|
        next unless event.has_key?(:id)
        event.merge!(:random_key => rand)
        document = lucene.document.Document.new

        event.each do |fname, value|
          if fname == :id
            field = lucene.document.Field.new(fname.to_s, value.to_s, stored, not_analyzed)
          else
            field = lucene.document.Field.new(fname.to_s, value.to_s, not_stored, not_analyzed)
          end
          document.add(field)
        end
        
        index.add_document(document)
      end
      
      index.close
    end
    
    def sample(query_string, options = {:size => 10})
      searcher = lucene.search.IndexSearcher.new(directory);
      
      if query_string.empty?
        query = lucene.search.MatchAllDocsQuery.new
      else
        parser = lucene.queryParser.QueryParser.new(lucene_version, "created_at", analyzer);
        query = parser.parse(query_string);
      end
      
      sort = lucene.search.Sort.new(random_sort_field)
      # collector = lucene.search.TopScoreDocCollector.create(options[:count], true);
      collector = lucene.search.TopFieldCollector.create(sort, options[:size], true, false, false, false);
      searcher.search(query, collector);
      
      hits = collector.topDocs.scoreDocs
      
      results = []
      0.upto(hits.length - 1) do |doc_num|
        results << searcher.doc(hits[doc_num].doc).get("id")
      end
      
      searcher.close
      
      results
    end
    
  protected
    def path
      File.join(Configuration.instance.index_path, "events", name)
    end
    
    def directory
      lucene.store.MMapDirectory.new(java.io.File.new(path))
    end
    
    def exists?
      lucene.index.IndexReader.index_exists(directory)
    end
    
    def analyzer
      lucene.analysis.standard.StandardAnalyzer.new(lucene_version)
    end
    
    def max_field_length
      lucene.index.IndexWriter::MaxFieldLength::UNLIMITED
    end
    
    def exists
      lucene.index.IndexReader.index_exists(directory)
    end
    
    def stored
      lucene.document.Field::Store::YES
    end
    
    def not_stored
      lucene.document.Field::Store::NO
    end
    
    def not_analyzed
      lucene.document.Field::Index::NOT_ANALYZED
    end
    
    def lucene_version
      lucene.util.Version::LUCENE_30
    end
    
    def random_sort_field
      lucene.search.SortField.new("random_key", lucene.search.SortField::DOUBLE)
    end
  end
end