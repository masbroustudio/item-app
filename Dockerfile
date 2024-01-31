# Menentukan image dasar yang akan digunakan untuk membangun image baru. 
# Dalam hal ini, image dasar yang digunakan adalah node:14.
FROM node:14

# Menentukan working directory didalam container
WORKDIR /app

# Menyalin semua file dari direktori saat ini ke direktori kerja di dalam container.
COPY . .

# Menetapkan variabel NODE_ENV dan DB_HOST. 
# Nilai NODE_ENV diatur ke production, nilai DB_HOST diatur ke item-db.
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal semua dependensi yang diperlukan untuk aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 di dalam container
EXPOSE 8080

# Menentukan perintah default yang akan dijalankan ketika container dimulai
CMD ["npm", "start"]