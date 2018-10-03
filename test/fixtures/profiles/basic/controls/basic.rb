
fixtures_path = File.expand_path(File.join(__FILE__, '..', '..', '..'))

control 'detect missing alt attr for img element' do
  describe pa11y_linted_html_file(File.join(fixtures_path, 'failing.html'), opts) do
    # opts:
    #  ruleset option (specify a Ruleset you wish to enforce)
    #  ignore options (list rules you wish to ignore)

    it { should have_no_violations }
    its('violation_names') { should_not include 'very_bad_thing' }
    its('violation_occurences') { ... }
    its('pa11y_json_output') { should ...

    its('content') do
      should match(/\balt\b/) # Something horrifying
    end
  end
end