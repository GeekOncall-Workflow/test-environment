# Test Environment
This contains the necessary code to bring up a local test environment.  It should be as portable as possible, with minimal requirements from the host OS

### Pre-requisites
1. Git (obviously)
2. VirtualBox, installed from their site.  No other providers have been tested.
3. Vagrant, installed from their site.
4. An understanding of basic Vagrant commands (up, destroy, provision)

### Use
After fulfilling the requirements, standard Vagrant interaction applies.

##### box-scripts
These scripts should only contain the step necessary to get from the base Vagrant box to a successful Puppet run.  The Vagrantfile should only call the base script, which accepts arguments.  Any arguments passed should be the names scripts that might need to be called for certain machines.  This should probably only happen for the Puppet master, since all other configuration should be done by Puppet.  No cheating!  
  
Example:  This block of code calls the base script, which will then call the puppet-master script.
`box.vm.provision "shell" do |s|`  
`  s.path = "box-scripts/base"`  
`  s.args = "puppet-master"`  
`end`
