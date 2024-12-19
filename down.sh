docker compose down --rmi all -v
rm -rf wordpress/db_data/*
rm -rf wordpress/volume/*
docker system prune -a --volumes -f
