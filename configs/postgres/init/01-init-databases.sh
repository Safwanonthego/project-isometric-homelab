#!/bin/bash
# Runs automatically on the FIRST boot only (empty data dir).
# Creates the `authentik` and `netbox` roles/databases referenced in
# their respective compose files (AUTHENTIK_POSTGRESQL__* / DB_*).
set -euo pipefail

AUTHENTIK_PW="$(cat /run/secrets/authentik_db_password)"
NETBOX_PW="$(cat /run/secrets/netbox_db_password)"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER authentik WITH PASSWORD '${AUTHENTIK_PW}';
    CREATE DATABASE authentik OWNER authentik;
    GRANT ALL PRIVILEGES ON DATABASE authentik TO authentik;

    CREATE USER netbox WITH PASSWORD '${NETBOX_PW}';
    CREATE DATABASE netbox OWNER netbox;
    GRANT ALL PRIVILEGES ON DATABASE netbox TO netbox;
EOSQL
