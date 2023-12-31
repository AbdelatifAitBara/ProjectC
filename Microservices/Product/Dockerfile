# Use a minimal base image
FROM python:3.11.6-alpine AS base

# Add a non-root user to the image
RUN adduser -D phenix

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY product.py requirements.txt cert.pem ./

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Use a multistage build
FROM base AS final

# Define environment variables


ARG MYSQL_DATABASE_USER
ARG MYSQL_DATABASE_PASSWORD
ARG MYSQL_DATABASE_DB
ARG MYSQL_DATABASE_HOST
ARG PRODUCT_API_URL
ARG CONSUMER_KEY
ARG CONSUMER_SECRET
ARG SECRET_KEY
ARG NAME
ARG DB_PORT


# Define environment variables
ENV MYSQL_DATABASE_USER=$MYSQL_DATABASE_USER \
    MYSQL_DATABASE_PASSWORD=$MYSQL_DATABASE_PASSWORD \
    MYSQL_DATABASE_DB=$MYSQL_DATABASE_DB \
    MYSQL_DATABASE_HOST=$MYSQL_DATABASE_HOST \
    PRODUCT_API_URL=$PRODUCT_API_URL \
    CONSUMER_KEY=$CONSUMER_KEY \
    CONSUMER_SECRET=$CONSUMER_SECRET \
    SECRET_KEY=$SECRET_KEY \
    NAME=$NAME \
    DB_PORT=$DB_PORT


# Make port 8080 available to the world outside this container
EXPOSE 8080

# Switch to the non-root user before running the container
USER phenix

# Run the command to start the product.py script
CMD ["python", "product.py"]