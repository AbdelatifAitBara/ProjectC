# Base image
FROM python:3.9-alpine

# Define all build arguments  
ENV MYSQL_DATABASE_USER = "${MYSQL_DATABASE_USER}" \
    MYSQL_DATABASE_PASSWORD = "${MYSQL_DATABASE_PASSWORD}" \
    MYSQL_DATABASE_DB = "${MYSQL_DATABASE_DB}" \
    MYSQL_DATABASE_HOST = "${MYSQL_DATABASE_HOST}" \
    PRODUCT_API_URL = "${PRODUCT_API_URL}" \
    CONSUMER_KEY = "${CONSUMER_KEY}" \
    CONSUMER_SECRET = "${CONSUMER_SECRET}" \
    NAME = "${NAME}"

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
  --MYSQL_DATABASE_USER=$MYSQL_DATABASE_USER \
  --MYSQL_DATABASE_PASSWORD=$MYSQL_DATABASE_PASSWORD \
  --MYSQL_DATABASE_DB=$MYSQL_DATABASE_DB \
  --MYSQL_DATABASE_HOST=$MYSQL_DATABASE_HOST \
  --PRODUCT_API_URL=$PRODUCT_API_URL \
  --CONSUMER_KEY=$CONSUMER_KEY \
  --CONSUMER_SECRET=$CONSUMER_SECRET \
  --SECRET_KEY=$SECRET_KEY \
  --NAME=$NAME
