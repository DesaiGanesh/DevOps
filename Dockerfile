# Use the official Ubuntu base image
FROM ubuntu:latest

# Update package list and install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Start Apache service and keep the container running
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 for web traffic
EXPOSE 80
