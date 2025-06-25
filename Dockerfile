FROM centos:7

MAINTAINER desaiganesh3101992@gmail.com

# Install Apache HTTP Server and utilities
RUN yum install -y httpd zip unzip && \
    yum clean all

# Download the template zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Unzip the downloaded template
RUN unzip kindle.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf __MACOSX markups-kindle kindle.zip

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

