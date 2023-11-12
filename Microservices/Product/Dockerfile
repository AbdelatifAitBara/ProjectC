# Use a minimal base image
FROM python:3.9-alpine AS base

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY product.py requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Use a multistage build
FROM base AS final

# Define environment variables
ENV MYSQL_DATABASE_USER=$MYSQL_DATABASE_USER \
    MYSQL_DATABASE_PASSWORD=$MYSQL_DATABASE_PASSWORD \
    MYSQL_DATABASE_DB=$MYSQL_DATABASE_DB \
    MYSQL_DATABASE_HOST=$MYSQL_DATABASE_HOST \
    PRODUCT_API_URL=$PRODUCT_API_URL \
    CONSUMER_KEY=$CONSUMER_KEY \
    CONSUMER_SECRET=$CONSUMER_SECRET \
    SECRET_KEY=$SECRET_KEY \
    NAME=$NAME

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the command to start the product.py script
CMD python product.py \
    --mysql_database_user $MYSQL_DATABASE_USER \
    --mysql_database_password $MYSQL_DATABASE_PASSWORD \
    --mysql_database_db $MYSQL_DATABASE_DB \
    --mysql_database_host $MYSQL_DATABASE_HOST \
    --product_api_url $PRODUCT_API_URL \
    --consumer_key $CONSUMER_KEY \
    --consumer_secret $CONSUMER_SECRET \
    --secret_key $SECRET_KEY \
    --name $NAME