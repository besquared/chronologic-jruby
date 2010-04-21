module Chronologic
  module Indices
    class BaseIndex
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
end