# Use a minimal base image
FROM python:3.11.6-alpine AS base

# Add a non-root user to the image
RUN adduser -D phenix

# Set the working directory to /home/myuser/app
WORKDIR /home/myuser/app

# Copy the current directory contents into the container at /home/myuser/app
COPY customer.py requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Use a multistage build
FROM base AS final

# Define environment variables


ARG MYSQL_DATABASE_USER
ARG MYSQL_DATABASE_PASSWORD
ARG MYSQL_DATABASE_DB
ARG MYSQL_DATABASE_HOST
ARG CUSTOMER_API_URL
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
    CUSTOMER_API_URL=$CUSTOMER_API_URL \
    CONSUMER_KEY=$CONSUMER_KEY \
    CONSUMER_SECRET=$CONSUMER_SECRET \
    SECRET_KEY=$SECRET_KEY \
    NAME=$NAME \
    DB_PORT=$DB_PORT

# Use HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --fail http://localhost:7070/ || exit 1

# Switch to the non-root user before running the container
USER phenix

# Run the command to start the customer.py script
CMD ["python", "customer.py"]