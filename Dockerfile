FROM ubuntu:latest as base
MAINTAINER haokexin1214@gmail.com
ENV TZ=Asia/Tokyo
ADD .bashrc ~/.bashrc
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update -y  \
    && apt install -y build-essential python3-dev mono-complete golang nodejs default-jdk npm wget git ctags \
    && apt install libtinfo-dev locales cmake  -y --fix-missing \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
	&& apt-get clean -y \
    && apt autoremove -y
 
FROM base as vim
ARG GITUSER=haokexin
ARG GITEMAIL=haokexin1214@gmail.com
ADD .vimrc ~/.vimrc
ADD gruvbox.vim /usr/share/vim/vim82/colors/gruvbox.vim
RUN git config --global user.email $GITEMAIL \
    && git config --global user.name $GITUSER \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && cd /home  \
    && git clone https://github.com/vim/vim.git \
    && cd vim \
    && ./configure --with-features=huge \
                   --enable-python3interp=yes  \
                   --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu/ \
                   --enable-cscope --prefix=/usr \
    && make VIMRUNTIMEDIR=/usr/share/vim/vim82 \
    && make install\
    && vim +PluginInstall +qall\
    && cd ~/.vim/bundle/YouCompleteMe/ \
    && git submodule sync --recursive \
    && git submodule update --init --recursive \
    && python3 ~/.vim/bundle/YouCompleteMe/install.py --all \
    && apt remove --purge libtinfo-dev build-essential cmake -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/vim
CMD ["/bin/bash"]
