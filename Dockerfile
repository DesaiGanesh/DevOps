
FROM centos:7

LABEL maintainer="desaiganesh3101992@gmail.com"

# Install Apache HTTP Server and utilities
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download a sample image from a working template as a placeholder
ADD https://demo.htmlcodex.com/3556/welding-website-template/img/carousel-1.jpg /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
