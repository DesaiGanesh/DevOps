FROM almalinux:8

MAINTAINER desaiganesh3101992@gmail.com

RUN dnf install -y httpd zip unzip curl && \
    dnf clean all

WORKDIR /var/www/html/

# Download and validate the ZIP file
RUN curl -fL -o 7-mb.zip https://www.examplefile.com/compressed/zip/7-mb-zip

# Debug: confirm file exists
RUN ls -lh 7-mb.zip

# Unzip and clean up
RUN unzip 7-mb.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf __MACOSX markups-kindle 7-mb.zip

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
