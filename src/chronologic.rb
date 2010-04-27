require "java"
require File.join(File.dirname(__FILE__), '..', 'lib', 'lucene-core-3.0.1.jar')

require 'rubygems'
require 'active_support'

require File.join(File.dirname(__FILE__), 'chronologic', 'configuration')

require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'base_index')
require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'event_index')
require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'indexed_event')
require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'event_field')
require File.join(File.dirname(__FILE__), 'chronologic', 'indices', 'event_document')

require File.join(File.dirname(__FILE__), 'chronologic', 'adapters', 'base_adapter')
require File.join(File.dirname(__FILE__), 'chronologic', 'adapters', 'memory_adapter')

require File.join(File.dirname(__FILE__), 'chronologic', 'sample')
require File.join(File.dirname(__FILE__), 'chronologic', 'dataset')
require File.join(File.dirname(__FILE__), 'chronologic', 'timeline')

require File.join(File.dirname(__FILE__), 'chronologic', 'query', 'sampler')
require File.join(File.dirname(__FILE__), 'chronologic', 'query', 'sequential')

require File.join(File.dirname(__FILE__), 'chronologic', 'estimations', 'average')