# 1) Build stage — build the static files
FROM node:18-alpine AS builder

WORKDIR /app

# Copy manifest files and install deps
COPY package*.json ./
RUN npm ci

# Copy all code & build
COPY . .
RUN npm run build

# 2) Production stage — serve with nginx
FROM nginx:stable-alpine AS production

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built static files from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
