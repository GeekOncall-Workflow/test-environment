# Test Environment

This contains the necessary code to bring up a local test environment.  It should be as portable as possible, with minimal requirements from the host OS

### Pre-requisites

1. Git (obviously)
1. VirtualBox, installed from their site.  No other providers have been tested.
1. Vagrant, installed from their site.
1. An understanding of basic Vagrant commands (up, destroy, provision)

### Use

After fulfilling the requirements, standard Vagrant interaction applies.  The overall idea is to develop on the master, then commit our changes to our various other repos.

Here's a complete example, using puppet-r10k.

1. Add your SSH key to GitHub
1. Clone this repo and change to the cloned directory
1. Run `./git-sync` to pull all of the other repos into this directory
1. Deploy puppet-master VM: `vagrant up puppet-master`
1. Reload puppet-master to set selinux to enforcing: `vagrant reload puppet-master`
1. Reconfigure puppet-master to finish selinux configuration: `vagrant provision puppet-master`
1. Login to puppet-master: `vagrant ssh puppet-master`
1. Modify some files, such as those in hieradata.
1. In another terminal, `vagrant up` any relevant clients, then test the changes
1. Back on the master, run `/vagrant/master-sync` to synchronize the changes to this directory
1. Back in this repo's directory, `cd puppet-r10k`
1. `git pull` and resolve any conflicts
1. `git status` and resolve any remaining conflicts
1. `git add .`
1. `git commit -m "Some commit message"`
1. `git push`

##### Some Notes about SELinux

Since most Vagrant boxes come with SELinux disabled, any Puppet configuration that modifies SELinux will fail.  This won't cause the run to fail, but it will show red messages during the Puppet run, e.g. during a `vagrant up` or `vagrant provision`.

When an existing vagrant box is rebooted, it may come back up with SELinux enabled.  This is of particular note on the Puppet master, since SELinux will prevent agents from connecting, including the master itself.  To correct this, SSH to the master and re-run Puppet manually from the appropriate environment.  For example: `cd /etc/puppet/environments/production; puppet apply manifests/site.pp --modulepath=modules`.

##### box-scripts

These scripts should only contain the step necessary to get from the base Vagrant box to a successful Puppet run.  The Vagrantfile should only call the base script, which accepts arguments.  Any arguments passed should be the names scripts that might need to be called for certain machines.  This should probably only happen for the Puppet master, since all other configuration should be done by Puppet.  No cheating!

Example:  This block of code calls the base script, which will then call the puppet-master script.  The script pathnames are relative.

    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
      s.args = "puppet-master"
    end
