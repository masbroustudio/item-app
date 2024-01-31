#!/bin/bash

# Membuat Docker Image item-app tag v1
docker build -t item-app:v1 .

# Menmpilkan daftar docker images
docker images

# Menunggah docker image item-app ke Github Packages
docker tag item-app:v1 ghcr.io/masbroustudio/item-app:v1

# Melihat status Login Github
echo $GH_PACKAGES_TOKEN | docker login ghcr.io -u masbroustudio --password-stdin

# Mengunggah docker image item-app ke GitHub Packages
docker push ghcr.io/masbroustudio/item-app:v1