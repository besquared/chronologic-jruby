task :default => :spec

task :spec do
  files = FileList.new('spec/**/*_spec.rb')
  system("jruby -S spec #{files.join(' ')}")
end