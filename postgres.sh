sudo apt-get install -y docker.io
sudo systemctl enable --now docker
sudo docker run -d --name litellm-pg -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_DB=litellm -p 127.0.0.1:5432:5432 postgres:16
# DATABASE_URL will be: postgres://postgres:secret@127.0.0.1:5432/litellm
