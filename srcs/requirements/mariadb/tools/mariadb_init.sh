#!/bin/bash

# mariadbのデータディレクトリが存在しない場合、初期化を行う
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing MariaDB data directory..."
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
else
  echo "MariaDB data directory already initialized. Skipping initialization."
fi

# MariaDBをバックグラウンドで実行
mysqld_safe &

# MariaDBが起動するまで待機
until mysqladmin ping -h localhost --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

# データベースの作成
echo "Running SQL script..."
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" > build.sql
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;" >> build.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> build.sql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';" >> build.sql
echo "FLUSH PRIVILEGES ;" >> build.sql

mysql -uroot -p${MYSQL_ROOT_PASSWORD} < build.sql

# #MariaDB プロセスを前面で実行し続ける
wait
# exec "$@"
