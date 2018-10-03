
fixtures_path = File.expand_path(File.join(__FILE__, '..', '..', '..'))

control 'detect missing alt attr for img element' do
  describe file(File.join(fixtures_path, 'failing.html')) do
    its('content') do
      should match(/\balt\b/) # Something horrifying
    end
  end
end