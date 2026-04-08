# Use official Node.js LTS
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy app source
COPY . .

# Expose port (change if needed)
EXPOSE 3000

# Default runtime command
CMD ["npm", "start"]
