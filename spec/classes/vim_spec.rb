require 'spec_helper'

describe 'vim' do
  let :facts do
     { :boxen_user => 'octocat' }
  end

  it "installs vim and dependencies" do
    should contain_package('vim').with({
      'require' => 'Package[mercurial]'
    })

    should contain_package('mercurial').with({
      'require' => 'Package[docutils]'
    })

    should contain_package('docutils').with({
      'ensure'   => 'installed',
      'provider' => 'pip',
    })
  end
end
