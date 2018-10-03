# Here we use MiniTest/spec

require_relative '../helper'

describe 'a basic test suite' do

  # When:
  #  * an html file contains the 'img' element
  #  * and it doesn't contain the 'alt' text
  #  *   Then the control should fail
  #  *   Then the failure message should include 'This image doesn't comply with WCAG standards'
  describe 'when IMG is missing ALT' do
    include TestHelper

    it 'The profile should execute cleanly but with failures' do
      command_line = ''
      command_line += 'exec '
      command_line += File.join(fixtures_path, 'profiles', 'basic')

      run_result = run_inspec_with_json(command_line)
      run_result.stderr.must_be_empty
      run_result.exit_status.must_equal(100)
    end
  end
end