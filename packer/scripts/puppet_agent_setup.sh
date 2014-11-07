#! /bin/bash

echo "Calling agent install via curl..."
curl -k https://ip-172-31-34-227:8140/packages/current/install.bash | sudo bash
echo "Puppet install complete."
echo "Adding /usr/local/bin to root's PATH."
sudo echo "export PATH=$PATH:/usr/local/bin" >> ~/.bash_profile
echo "Linking packer and facter to /usr/bin"
sudo ln -s /opt/puppet/bin/puppet /usr/bin/puppet
sudo ln -s /opt/puppet/bin/facter /usr/bin/facter
echo "Initiate puppet provisioning run."
sleep 20
sudo -i puppet agent --no-daemonize --onetime --detailed-exitcodes --ignorecache --no-usecacheonfailure 
echo "Provisioning run complete."
