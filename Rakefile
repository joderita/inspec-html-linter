# This task template will make a task named 'test', and run
# the tests that it finds.
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList[
    'test/unit/*_test.rb',
    'test/integration/*_test.rb',
    'test/fucntion/*_test.rb',
  ]
  t.verbose = true
  # Ideally, we'd run tests with warnings enabled,
  # but the dependent gems have many warnings. As this
  # is an example, let's disable them so the testing
  # experience is cleaner.
  t.warning = false
end
