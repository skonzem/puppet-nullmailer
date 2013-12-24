require 'spec_helper'

describe 'nullmailer' do
  context 'supported operating systems' do
    ['Debian' ].each do |osfamily|
      describe "nullmailer class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily
        }}

        it { should contain_class('nullmailer::params') }
        it { should contain_class('nullmailer::install') }
        it { should contain_class('nullmailer::config') }
        it { should contain_class('nullmailer::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'nullmailer class without any parameters on RedHat' do
      let(:facts) {{
        :osfamily        => 'RedHat',
      }}

      it { expect { should }.to raise_error(Puppet::Error) }
    end
  end
end

