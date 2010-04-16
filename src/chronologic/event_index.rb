module Chronologic
  class EventIndex
    attr_accessor :name
    attr_accessor :lucene
    
    def initialize(name)
      @name = name
      @lucene = org.apache.lucene
    end
    
    def insert(event = {})
      index = lucene.index.IndexWriter.new(directory, analyzer, true, max_field_length)
      
      # id_text_pair_array.each {|id_text_pair|
      #   term_to_delete = lucene.index.Term.new("id", id_text_pair[0].to_s) # if it exists
      #   a_document = lucene.document.Document.new
      #   a_document.add(lucene.document.Field.new('text', id_text_pair[1],
      #                    lucene.document.Field::Store::YES,
      #                    lucene.document.Field::Index::TOKENIZED))
      #   a_document.add(lucene.document.Field.new('id', id_text_pair[0].to_s,
      #                    lucene.document.Field::Store::YES,
      #                    lucene.document.Field::Index::TOKENIZED))
      #   index_writer.updateDocument(term_to_delete, a_document) # delete any old docs with same id
      # }
      
      index.close
    end
    
    def update(key, event = {})
    end
    
    def remove(key)
    end
    
  protected
    
    def path
      File.join(Configuration.instance.index_path, "events", name)
    end
    
    def directory
      lucene.store.MMapDirectory.new(java.io.File.new(path))
    end
    
    def analyzer
      lucene.analysis.standard.StandardAnalyzer.new(lucene.util.Version::LUCENE_30)
    end
    
    def max_field_length
      lucene.index.IndexWriter::MaxFieldLength::UNLIMITED
    end
    
    def exists
      lucene.index.IndexReader.index_exists(directory)
    end
  end
end