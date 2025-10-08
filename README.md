Dockerfile for MTProxy
===


### Building

    docker build -t telegram-proxy .


### Running

    docker run -d --restart=unless-stopped \
        -p 10000:443 \
        -v proxy-config:/data \
        -e SECRET=00000000000000000000000000000000 \
        --name=telegram-proxy \
        telegram-proxy


### Links

* https://github.com/TelegramMessenger/MTProxy
* https://hub.docker.com/r/telegrammessenger/proxy
