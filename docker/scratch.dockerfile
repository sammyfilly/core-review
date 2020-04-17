FROM debian:bullseye

RUN echo 'Acquire::HTTP::Proxy "http://172.17.0.1:3142";' >> /etc/apt/apt.conf.d/01proxy \
 && echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y \
    automake \
	binutils \
    bzip2 \
	ca-certificates \
	clang \
    curl \
    diffoscope \
    gcc \
    g++ \
    git \
    libtool \
    man \
    make \
    pkg-config \
    python3 \
    vim \
    wget

RUN git clone https://github.com/bitcoin/bitcoin

RUN make download -C bitcoin/depends