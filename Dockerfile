
# Use a base image
FROM ubuntu:20.04

# Install curl and unzip
RUN apt-get update && apt-get install -y curl unzip

# Download a valid test ZIP file
RUN curl -fL -o 7-mb.zip https://file-examples.com/wp-content/uploads/2017/02/zip_2MB.zip

# Confirm file type
RUN file 7-mb.zip

# Unzip the file
RUN unzip 7-mb.zip -d /testdata

# Set working directory
WORKDIR /testdata

# Default command
CMD ["ls", "-l"]
