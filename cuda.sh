sudo apt-get update

sudo apt-get install -y dkms build-essential linux-headers-$(uname -r)

ubuntu-drivers devices      # see the "recommended" version (e.g., nvidia-driver-550 or -555)

sudo apt-get update
sudo apt-get install -y nvidia-driver-575


pip install torch --index-url https://download.pytorch.org/whl/cu121