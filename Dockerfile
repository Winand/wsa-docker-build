FROM ubuntu:23.04
# as builder
RUN apt update && \
    apt install -y git python3 aria2 sudo patchelf unzip qemu-utils attr && \
    apt clean
# FROM ubuntu:23.04
# COPY --from=builder MagiskOnWSALocal MagiskOnWSALocal
# RUN apt update && \
#     apt install -y lzip patchelf e2fsprogs python3 python3-pip aria2 p7zip-full attr unzip sudo && \
#     apt clean
# RUN apt update && \
#     apt install -y python3 python3-requests aria2 && \
#     apt clean
# RUN apt update && apt install -y sudo
# RUN apt install patchelf
# RUN apt install unzip
# RUN apt install -y qemu-utils
# RUN apt install -y attr
RUN git clone https://github.com/LSPosed/MagiskOnWSALocal.git
# COPY ./download /MagiskOnWSALocal/download
# RUN apt update && \
#     apt install -y e2fsprogs && \
#     apt clean
# reduce resulting size
RUN sed  -i 's/subformat=fixed/subformat=dynamic/g' /MagiskOnWSALocal/scripts/build.sh
CMD cd MagiskOnWSALocal && ./scripts/build.sh \
    --arch x64 \
    --release-type retail \
    --magisk-ver stable \
    --gapps-brand MindTheGapps \
    --gapps-variant pico \
    --root-sol none \
    --remove-amazon
    # --offline
