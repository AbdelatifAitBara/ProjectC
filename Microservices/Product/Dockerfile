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

ARG MYSQL_DATABASE_USER 
ARG MYSQL_DATABASE_DB
ARG MYSQL_DATABASE_HOST
ARG MYSQL_DATABASE_PORT

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the command to start the product.py script
CMD ["python", "product.py"]