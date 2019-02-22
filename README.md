## Getting started

1. Install dnsmasq to resolve `*.local` to `127.0.0.1`
    - Run: `bin/install-dnsmasq-mac.sh`
    - Not in mac? Add manually the domains to `/etc/hosts`
2. Build the custom images for the project
    - DB (MySQL)
        - `cd docker_resources/db`
        - `docker build -t development:mysql .`
    - Web (Apache/PHP)
        - `cd docker_resources/web`
        - `docker build -t development:project .`

Go to the root of the project and 

`docker-compose up`

Wait until the MySQL server is configured, then you can access your project through

http://project.development.local