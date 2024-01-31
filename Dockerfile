# Menggunakan Node.js versi 14
FROM node:14

# Menentukan working directory kontainer
WORKDIR /app

# Menyalin file ke working directory di kontainer
COPY . .

# Menentukan ke production mode dan menggunakan container item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port yang digunakan oleh aplikasi (8080)
EXPOSE 8080

# Saat container diluncurkan, jalankan server dengan perintah npm start
CMD ["npm", "start"]
