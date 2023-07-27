# Sử dụng một hình ảnh gốc có sẵn của Node.js
FROM node:lts-alpine
# Đặt thư mục làm thư mục làm việc trong container
WORKDIR /usr/src/app

# Sao chép package.json và package-lock.json vào thư mục làm việc
COPY package*.json ./

# Cài đặt các phụ thuộc
RUN npm install

# Sao chép toàn bộ mã nguồn vào thư mục làm việc
COPY . .

# Xây dựng ứng dụng Next.js
RUN npm run build

# Chạy prisma
RUN npm run postinstall

# Mở cổng 3000 cho ứng dụng
EXPOSE 3000

# Khởi chạy ứng dụng Next.js
CMD [ "npm", "run", "start" ]