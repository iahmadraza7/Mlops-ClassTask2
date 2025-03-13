FROM python:3.13

WORKDIR /app

# Install Backend Dependencies
COPY app/backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Backend and Frontend
COPY app /app

# Ensure templates are copied correctly
WORKDIR /app/backend

# Install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Remove default Nginx config and copy our own
RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/sites-enabled/

# Expose Flask (5000) and Nginx (8080)
EXPOSE 5000 8080

# Ensure Nginx starts before Flask
CMD service nginx start && sleep 2 && python main.py
