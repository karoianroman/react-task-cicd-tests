# 1. Етап збірки (Build stage)
FROM node:24-slim AS build
RUN corepack enable pnpm
WORKDIR /app
COPY pnpm-lock.yaml package.json ./
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm run build
USER node

# 2. Етап запуску (Production stage)
FROM nginx:stable-alpine
RUN apk upgrade --no-cache && \
    sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/log/nginx && \
    touch /var/run/nginx.pid && chown nginx:nginx /var/run/nginx.pid

COPY --from=build /app/dist /usr/share/nginx/html

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:8080/ || exit 1

USER nginx

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]