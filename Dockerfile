# Use official Node.js LTS
FROM python:3.11-alpine

# Create app directory
WORKDIR /app
COPY requirements.txt ./
# Install dependencies
RUN pip install --no-cache-dir -r requirment.txt

# Copy app source
COPY . .

# Expose port (change if needed)
EXPOSE 5000

# Default runtime command
CMD ["python", "app.py"]
