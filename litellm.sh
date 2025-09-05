python3.11 -m venv ~/litellm-env
source ~/litellm-env/bin/activate
pip install --upgrade pip
pip install "litellm[proxy]"  # includes the server deps (fixes the backoff error you saw before)

pip install prisma


export LITELLM_MASTER_KEY="sk-prod-master-$(openssl rand -hex 16)"
export LITELLM_SALT_KEY="$(openssl rand -hex 32)"  # don't change once set
export STORE_MODEL_IN_DB=True
export PORT=4000
export DATABASE_URL=YOUR URL

find ~/litellm-env/lib/python3.11/site-packages/litellm -name "schema.prisma"
prisma generate --schema=/home/mason/litellm-env/lib/python3.11/site-packages/litellm/proxy/schema.prisma



litellm --config litellm.config.yaml --host 0.0.0.0 --port 4000
