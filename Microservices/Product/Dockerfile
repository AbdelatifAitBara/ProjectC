# Base image
FROM python:3.9-alpine

# Define all build arguments  
ARG MYSQL_DATABASE_USER
ARG MYSQL_DATABASE_PASSWORD 
ARG MYSQL_DATABASE_DB
ARG MYSQL_DATABASE_HOST
ARG PRODUCT_API_URL
ARG CONSUMER_KEY
ARG CONSUMER_SECRET
ARG SECRET_KEY
ARG NAME

# Set working directory
WORKDIR /app

# Copy files  
COPY product.py requirements.txt ./

# Install dependencies
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port
EXPOSE 8080

# Command uses build arguments directly
CMD python product.py \
  --mysql_user=$MYSQL_DATABASE_USER \
  --mysql_password=$MYSQL_DATABASE_PASSWORD \
  --mysql_db=$MYSQL_DATABASE_DB \
  --mysql_host=$MYSQL_DATABASE_HOST \
  --product_api_url=$PRODUCT_API_URL \
  --consumer_key=$CONSUMER_KEY \
  --consumer_secret=$CONSUMER_SECRET \
  --secret_key=$SECRET_KEY \
  --name=$NAME