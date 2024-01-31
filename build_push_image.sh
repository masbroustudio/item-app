#!/bin/bash
# Menentukan shell yang akan digunakan untuk menjalankan skrip

# Membangun image Docker item-app:v1 dari Dockerfile yang terletak di direktori saat ini 
docker build -t item-app:v1 .

# Menampilkan daftar image Docker yang ada di sistem
docker images

# Mengunggah docker image item-app ke Github Packages
docker tag item-app:v1 ghcr.io/masbroustudio/item-app:v1

# Melakukan login ke GitHub Container Registry menggunakan token akses yang disimpan dalam variabel lingkungan $GH_PACKAGES_TOKEN
echo $GH_PACKAGES_TOKEN | docker login ghcr.io -u masbroustudio --password-stdin

# Mengunggah docker image item-app ke GitHub Container Registry
docker push ghcr.io/masbroustudio/item-app:v1