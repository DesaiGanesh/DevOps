FROM almalinux:8

MAINTAINER desaiganesh3101992@gmail.com

# Install Apache HTTP Server and utilities
RUN dnf install -y httpd zip unzip curl && \
    dnf clean all

# Download the zip file and rename it
ADD https://www.examplefile.com/compressed/zip/7-mb-zip /var/www/html/7-mb.zip

# Set working directory
WORKDIR /var/www/html/

# Debug: list files to confirm the zip exists
RUN ls -l /var/www/html/

# Unzip and clean up
RUN unzip 7-mb.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf __MACOSX markups-kindle 7-mb.zip

# Expose HTTP port
EXPOSE 80

# Health check to ensure Apache is running
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
