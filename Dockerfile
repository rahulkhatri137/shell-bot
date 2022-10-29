FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq -y dist-upgrade \
    && apt-get -qq -y install --no-install-recommends neofetch build-essential npm gawk rename aria2 arj brotli cabextract make cmake device-tree-compiler gcc g++ git liblz4-tool liblzma-dev libtinyxml2-dev lz4 mpack nodejs openjdk-11-jdk p7zip-full p7zip-rar python3 python3-pip tmate rar sharutils unace unrar unzip uudeview gzip xz-utils zip zlib1g-dev locales python3-lxml libc-ares-dev libcrypto++-dev libcurl4-openssl-dev libmagic-dev libsodium-dev libsqlite3-dev libssl-dev git aria2 curl ffmpeg jq p7zip-full pv gcc libpq-dev

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN set -ex \
    && apt-get -qq -y install --no-install-recommends locales python3 python3-lxml python3-pip python3-dev libc-ares-dev libcrypto++-dev libcurl4-openssl-dev libmagic-dev libsodium-dev libsqlite3-dev libssl-dev git aria2 curl ffmpeg jq p7zip-full pv gcc libpq-dev unzip \
    && curl -fsSLO https://raw.githubusercontent.com/rahulkhatri137/mirrorbot137/master/requirements.txt && pip3 install --no-cache-dir --upgrade -r requirements.txt && rm requirements.txt
    && chmod 777 . \ 
    && cp extract pextract /usr/local/bin \
    && chmod +x aria.sh /usr/local/bin/extract /usr/local/bin/pextract

CMD ["node", "server"]
