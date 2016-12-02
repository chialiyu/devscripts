sudo chef-client
sudo sv stop chef-client
sudo service chef-client stop

#Test-Kitchen
kitchen List
kitchen destroy
kitchen create default-RHEL67-vagrant
Kitchen create <platform - regex>
kitchen converge <platform - regex>
kitchen login <boxname - regex>
## Control-D log off from kitchen image
kitchen verify <boxname - regex>
## Run chefspec and serverspec with converge

# Debug kitchen
kitchen create <platform - regex> -l debug (or info)

rm berksfile.lock
## Remove berksfile when dependencies failed to update
## Berksfile - Define cookbook dependency path

# serverspec
# http://serverspec.org/
# kitchen verify -- to verify serverspec output.

#chefspec
RSpec .
#rspec <path to the test file>
#run all specs
rspec spec

#Test berksfile -  dependencies
berks install

# Run rake <task>
bundle exec rake integration:openstack

# Knife commmands
knife environment from file ~/chef-repo/environments/development.json
