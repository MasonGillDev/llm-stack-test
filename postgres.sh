sudo apt-get install -y docker.io
sudo systemctl enable --now docker
sudo docker run -d --name litellm-pg -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_DB=litellm -p 127.0.0.1:5432:5432 postgres:16
# DATABASE_URL will be: postgres://postgres:secret@127.0.0.1:5432/litellm


# the above doesnt work in an lxd instance.


# Install Postgres 16 (Ubuntu 24.04)
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

# Start & enable
sudo systemctl enable --now postgresql

# Set a password for the default 'postgres' role
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'secret';"

# Create the litellm database
sudo -u postgres createdb litellm

# Edit pg_hba.conf
sudo sed -i 's/^local\s\+all\s\+postgres\s\+peer/local all postgres md5/' /etc/postgresql/*/main/pg_hba.conf
sudo sed -i 's/^local\s\+all\s\+all\s\+peer/local all all md5/' /etc/postgresql/*/main/pg_hba.conf

# (Optional) ensure Postgres listens on localhost (default is fine)
sudo sed -i "s/^#\?listen_addresses.*/listen_addresses = 'localhost'/" /etc/postgresql/*/main/postgresql.conf

# Reload to apply
sudo systemctl restart postgresql
#postgresql://postgres:secret@127.0.0.1:5432/litellm
