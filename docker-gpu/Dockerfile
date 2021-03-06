#CycleGAN Dockerfile https://github.com/junyanz/CycleGAN
FROM nvidia/cuda:8.0-cudnn5-devel

MAINTAINER "davidpkatz@gmail.com"

# update and install some deps
RUN apt-get update && \
    apt-get install --assume-yes git wget sudo libhdf5-serial-dev hdf5-tools
    
# install torch
RUN git clone https://github.com/torch/distro.git ~/torch --recursive && \
    cd ~/torch && \
    bash install-deps && \
    ./install.sh

WORKDIR ~/torch

RUN luarocks install nngraph && \
	luarocks install class && \
	luarocks install hdf5 && \
	luarocks install https://raw.githubusercontent.com/szym/display/master/display-scm-0.rockspec

# Export environment variables manually
ENV LUA_PATH='/root/.luarocks/share/lua/5.1/?.lua;/root/.luarocks/share/lua/5.1/?/init.lua;/root/torch/install/share/lua/5.1/?.lua;/root/torch/install/share/lua/5.1/?/init.lua;./?.lua;/root/torch/install/share/luajit-2.1.0-beta1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua'
ENV LUA_CPATH='/root/.luarocks/lib/lua/5.1/?.so;/root/torch/install/lib/lua/5.1/?.so;./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so'
ENV PATH=/root/torch/install/bin:$PATH
ENV LD_LIBRARY_PATH=/root/torch/install/lib:$LD_LIBRARY_PATH
ENV DYLD_LIBRARY_PATH=/root/torch/install/lib:$DYLD_LIBRARY_PATH
ENV LUA_CPATH='/root/torch/install/lib/?.so;'$LUA_CPATH

WORKDIR ~/
RUN git clone https://github.com/junyanz/CycleGAN && \
	cd CycleGAN

RUN ./models/download_all_models.sh
RUN ./datasets/download_all_datasets.sh