# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Install netcat-openbsd
RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the local app files to the container's working directory
COPY . /app

# Expose port 5000 to allow access to the Flask app
EXPOSE 5000

# Set the command to run the Flask app
CMD ["python", "app.py"]