FROM almalinux:8

MAINTAINER desaiganesh3101992@gmail.com

RUN dnf install -y httpd zip unzip curl file && \
    dnf clean all

WORKDIR /var/www/html/

# Download a valid test ZIP file
RUN curl -fL -o 7-mb.zip https://testfilehub.github.io/zip/5mb.zip

# Confirm file type
RUN file 7-mb.zip

# Unzip and clean up
RUN unzip 7-mb.zip || echo "Skipping unzip if archive is empty or invalid" && \
    rm -f 7-mb.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
