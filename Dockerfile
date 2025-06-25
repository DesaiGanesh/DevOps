FROM almalinux:8

MAINTAINER desaiganesh3101992@gmail.com

# Install required packages
RUN dnf install -y httpd zip unzip curl file && \
    dnf clean all

WORKDIR /var/www/html/

# Download a valid ZIP file
RUN curl -fL -o 7-mb.zip https://file-examples.com/storage/fe1b9f3e1b6c2e7f3e1b9f3e/2017/02/zip_2MB.zip

# Confirm file type
RUN file 7-mb.zip

# Unzip and clean up
RUN unzip 7-mb.zip && \
    rm -f 7-mb.zip

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
