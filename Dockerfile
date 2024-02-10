# Базовый образ
FROM node:latest as build

# Установка рабочей директории
WORKDIR /app

# Копирование файлов проекта
COPY . .

# Установка зависимостей и сборка проекта
RUN npm install
RUN npm run build

# Финальный образ
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]