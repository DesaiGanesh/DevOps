FROM almalinux:8

MAINTAINER desaiganesh3101992@gmail.com

# Install Apache HTTP Server and utilities
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download the zip file and rename it for clarity
ADD https://www.examplefile.com/compressed/zip/7-mb-zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Unzip and clean up
RUN unzip 7-mb.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf __MACOSX markups-kindle 7-mb.zip

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
