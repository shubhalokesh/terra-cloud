sudo apt update

# Install software-properties-common
sudo apt install -y software-properties-common

# Add Ansible PPA repository
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Create Ansible roles directory
mkdir -p ~/ansible/roles

# Print success message
echo 'Ansible installed successfully'
