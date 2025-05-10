FROM gustavovinicius/guspy:databases
#FROM ubuntu:jammy
WORKDIR /var/www/html
ENTRYPOINT ["tail", "-f", "/dev/null"]
