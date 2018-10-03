module InspecResources
  class Pa11yHtmlLintedFile < Inspec.resource(1)
    name 'pa11y_html_linted_file'
    desc 'Detects accessibility issues in HTML files'
    example '
      describe pa11y_html_linted file(path, opts) do
        it { should have_no_violations }
      end
    '
    supports_platform :os


    # like actually do it
    # install ap11y via npm

    # vivify results on property / matcher access
    # implement properties
    # implement matchers
  end
end