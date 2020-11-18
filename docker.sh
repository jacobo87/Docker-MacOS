#!/bin/bash

# ####################### Docker MySQL ########################

set -x

apt update

# Instalamos curl
apt install curl -y

# Instalamos mysql client y server
apt install mysql-client-core-5.7 -y
apt install mysql-server-5.7 -y

# Actualizar el índice de paquetes 
apt-get install \ apt-transport-https \ ca-certificates \ curl \ gnupg-agent \ software-properties-common -y

# Añadimos el repositorio oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 

# Instalamos Docker
apt install docker -y
apt install docker.io -y

# Descargamos la última versión docker MySQL
docker pull mysql

# Lanzamos instancia con persistencia de datos en segundo plano
docker run -d --rm --name mysql-version-8.0.22 -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v mysql_data:/var/lib/mysql mysql:8.0.22
