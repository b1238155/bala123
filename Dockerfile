# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variable for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory in the container
WORKDIR /app

# Update apt repositories and install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends python3 python3-pip git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install virtualenv separately to ensure it completes successfully
RUN pip3 install --no-cache-dir virtualenv

# Copy the current directory contents into the container at /app
COPY . /app

# Debugging step: Display the contents of the requirements.txt file
RUN echo "Contents of requirements.txt:" && cat requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
