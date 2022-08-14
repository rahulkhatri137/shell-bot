FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq -y dist-upgrade \
    && apt-get -qq -y install --no-install-recommends neofetch build-essential npm gawk rename aria2 arj brotli cabextract make cmake device-tree-compiler gcc g++ git liblz4-tool liblzma-dev libtinyxml2-dev lz4 mpack nodejs openjdk-11-jdk p7zip-full p7zip-rar python3 python3-pip tmate rar sharutils unace unrar unzip uudeview gzip xz-utils zip zlib1g-dev locales python3-lxml libc-ares-dev libcrypto++-dev libcurl4-openssl-dev libmagic-dev libsodium-dev libsqlite3-dev libssl-dev git aria2 curl ffmpeg jq p7zip-full pv gcc libpq-dev

WORKDIR /usr/src/app
COPY . .
RUN npm install

CMD ["node", "server"]
