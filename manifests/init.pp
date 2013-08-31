# Installs vim

# Examples
#
#   include vim
#
class vim {
  package { 'vim':
    require => Package['mercurial']
  }

  # Install mercurial since the vim brew package don't satisfy the requirement (vim is fetched using $ hg)
  package { 'mercurial':
    require => Package['docutils']
  }

  # docutils is required by mercurial.
  # https://github.com/boxen/puppet-vim/issues/12
  package { 'docutils':
    ensure   => installed,
    provider => pip,
  }
}
