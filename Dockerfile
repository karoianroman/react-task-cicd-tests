# 1. Етап збірки (Build stage)
FROM node:24-slim AS build
RUN corepack enable pnpm
WORKDIR /app
COPY pnpm-lock.yaml package.json ./
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm run build

# 2. Етап запуску (Production stage)
FROM nginx:stable-alpine
RUN apk upgrade --no-cache && \
    sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]