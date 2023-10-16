# ---- Copy from Next.js Build ----
FROM node:alpine AS nextjs-builder

WORKDIR /app

COPY ./client/package*.json ./
RUN npm ci

COPY ./client .
RUN npm run build

# ---- Nginx Stage ----
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy static assets from Next.js build stage
COPY --from=nextjs-builder /app/out /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

