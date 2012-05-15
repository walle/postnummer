require 'rake'

require 'bundler'
require 'rake/testtask'

Bundler::GemHelper.install_tasks

desc "Run tests"
Rake::TestTask.new("test") { |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
}

task :default => [:test]
