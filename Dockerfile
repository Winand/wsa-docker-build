FROM ubuntu:23.04

ARG arch=x64
ARG release-type=retail
ARG magisk-ver=stable
ARG gapps-brand=MindTheGapps
ARG gapps-variant=pico
ARG root-sol=none

RUN apt update && \
    apt install -y git python3 aria2 sudo patchelf unzip qemu-utils attr && \
    apt clean
RUN git clone https://github.com/LSPosed/MagiskOnWSALocal.git
# COPY ./download /MagiskOnWSALocal/download
# reduce resulting size
RUN sed  -i 's/subformat=fixed/subformat=dynamic/g' /MagiskOnWSALocal/scripts/build.sh
CMD cd MagiskOnWSALocal && ./scripts/build.sh \
    --arch ${arch} \
    --release-type ${release-type} \
    --magisk-ver ${magisk-ver} \
    --gapps-brand ${gapps-brand} \
    --gapps-variant ${gapps-variant} \
    --root-sol ${root-sol} \
    --remove-amazon
    # --offline
