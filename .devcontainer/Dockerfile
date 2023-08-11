FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye

ENV DOCKER_BUILDKIT=1
ENV PICO_BASE_PATH="/pico/"
ENV PICO_SDK_PATH="${PICO_BASE_PATH}/pico-sdk/"

RUN mkdir /pico/
RUN mkdir /tools/
RUN mkdir /workspace/

COPY ./tools/ /tools/

RUN apt-get update
RUN apt-get install -y binutils-multiarch gdb-multiarch git \
	automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev pkg-config \
	cmake gcc-arm-none-eabi libnewlib-arm-none-eabi

RUN ln -s /usr/bin/objdump /usr/bin/objdump-multiarch
RUN ln -s /usr/bin/nm /usr/bin/nm-multiarch

# Build & install OpenOCD
WORKDIR ${PICO_BASE_PATH}
RUN git clone https://github.com/raspberrypi/openocd.git --branch rp2040 --depth=1
WORKDIR ${PICO_BASE_PATH}/openocd
RUN ./bootstrap
RUN ./configure
RUN make -j4
RUN make install

# Download SDK
WORKDIR ${PICO_BASE_PATH}
RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master
WORKDIR ${PICO_BASE_PATH}/pico-sdk
RUN git submodule update --init
RUN cd ..
RUN git clone https://github.com/raspberrypi/pico-examples.git --branch master

# Build Picotool
WORKDIR ${PICO_BASE_PATH}
RUN git clone https://github.com/raspberrypi/picotool.git --branch master
WORKDIR ${PICO_BASE_PATH}/picotool/
RUN mkdir build
WORKDIR ${PICO_BASE_PATH}/picotool/build/
RUN cmake ../
RUN make

# Build Picoprobe
WORKDIR ${PICO_BASE_PATH}
RUN git clone https://github.com/raspberrypi/picoprobe.git
WORKDIR ${PICO_BASE_PATH}/picoprobe/
RUN git submodule update --init
RUN mkdir build
WORKDIR ${PICO_BASE_PATH}/picoprobe/build/
RUN cmake ..
RUN make -j4
