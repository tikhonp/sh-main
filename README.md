# sh-main

_Docker-Compose/NGINX_

Reverse proxy server for routing requests to various backend services.

## Deployment

> Ensure you have _Docker_, _Docker Compose_ and _Make_ installed on your server.

1. Clone the repository:
   ```bash
   git clone --recurse-submodules git@github.com:tikhonp/main-proxy.git
   cd sh-main
   ```

2. Obtain SSL certificates using Let's Encrypt:
    ```bash
    make all
    ```

3. Start the services using Docker Compose:
   ```bash
   docker-compose up -d
   ```

4. Verify that the services are running by checking dozzle service on `https://dozzle.tikhonnnnn.com`


Tikhon Petrishchev 2025. All rights reserved.
