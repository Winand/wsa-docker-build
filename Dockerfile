FROM ubuntu:23.04

ARG arch=x64
ARG releaseType=retail
ARG magiskVer=stable
ARG gappsBrand=MindTheGapps
ARG gappsVariant=pico
ARG rootSol=none

RUN apt update && \
    apt install -y git python3 aria2 sudo patchelf unzip qemu-utils attr && \
    apt clean
RUN git clone https://github.com/LSPosed/MagiskOnWSALocal.git
# COPY ./download /MagiskOnWSALocal/download
# reduce resulting size
RUN sed  -i 's/subformat=fixed/subformat=dynamic/g' /MagiskOnWSALocal/scripts/build.sh

ENV arch=$arch releaseType=$releaseType magiskVer=$magiskVer \
    gappsBrand=$gappsBrand gappsVariant=$gappsVariant rootSol=$rootSol
CMD cd MagiskOnWSALocal && ./scripts/build.sh \
    --arch $arch \
    --release-type $releaseType \
    --magisk-ver $magiskVer \
    --gapps-brand $gappsBrand \
    --gapps-variant $gappsVariant \
    --root-sol $rootSol \
    --remove-amazon
    # --offline
