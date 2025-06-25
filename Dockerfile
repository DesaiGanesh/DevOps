FROM almalinux:8

RUN dnf install -y httpd zip unzip curl file && \
    dnf clean all

WORKDIR /var/www/html/

# Download a known good ZIP file
RUN curl -fL -o 7-mb.zip https://file-examples.com/wp-content/uploads/2017/02/zip_2MB.zip

# Confirm file type
RUN file 7-mb.zip

# Unzip and clean up
RUN unzip 7-mb.zip && \
    rm -rf 7-mb.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
