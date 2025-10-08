FROM debian AS build
RUN apt-get update \
 && apt-get install -y git gcc make libssl-dev zlib1g-dev
WORKDIR /opt/MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy .
COPY 0.patch .
RUN git apply 0.patch
RUN make

FROM debian
RUN apt-get update \
 && apt-get install -y curl iproute2
ADD https://core.telegram.org/getProxySecret /etc/telegram/proxy-secret
COPY --from=build /opt/MTProxy/objs/bin/mtproto-proxy /usr/local/bin/
COPY run.sh /
RUN chmod a+x /run.sh
ENTRYPOINT ["/run.sh"]
