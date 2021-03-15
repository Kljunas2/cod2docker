FROM ubuntu

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install -y curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 libstdc++5:i386 python3 cpio iproute2

RUN useradd cod2server
ADD cod2 /home/cod2server
RUN chown -R cod2server:cod2server /home/cod2server
WORKDIR /home/cod2server
USER cod2server

EXPOSE 28960/udp

CMD /home/cod2server/cod2_lnxded
