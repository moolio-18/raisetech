require 'spec_helper'

listen_port = 80

describe command('curl http://127.0.0.1:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

describe service('nginx') do
#  it { should be_enabled }
  it { should be_running }
end

describe service('puma.service') do
#  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('ruby --version') do
  its(:stdout) { should match /ruby 3\.2\.3/ }
end
