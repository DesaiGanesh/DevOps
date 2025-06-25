FROM almalinux:8

RUN dnf install -y httpd zip unzip curl file && \
    dnf clean all

WORKDIR /var/www/html/

# Download a working ZIP file
RUN curl -fL -o 7-mb.zip https://github.com/seladb/PcapPlusPlus/releases/download/v22.11/Examples.zip

# Confirm file type
RUN file 7-mb.zip

# Unzip and clean up
RUN unzip 7-mb.zip && \
    rm -rf 7-mb.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
