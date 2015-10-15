# This file is for boostrapping the Puppet server.  For other nodes, see
# https://github.com/devops-workflow/puppet-r10k/blob/production/manifests/site.pp

node 'puppet-master' {
  class { '::puppet':
    server => true,
    server_foreman => false,
    server_environments => [],
  }
}
