# Add deadsnakes (gives you Python 3.11 on Ubuntu 24.04)
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update

# Python 3.11 + venv + headers (headers are important for Triton)
sudo apt-get install -y python3.11 python3.11-venv python3.11-dev build-essential


python3.11 -m venv ~/vllm-env
source ~/vllm-env/bin/activate
python -m pip install --upgrade pip wheel


pip install torch --index-url https://download.pytorch.org/whl/cu121
pip install "vllm[all]"
# optional but useful:
pip install transformers accelerate sentencepiece
