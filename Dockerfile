# Ubuntu 16.04，16.04,Xenial Xerus (好客的非洲地松鼠),2016年4月 （LTS）
FROM ubuntu:xenial

# 胡深
MAINTAINER Mark Hu <markhskj@163.com>

# APT 自动安装 Python 相关的依赖包，如需其他依赖包在此添加
RUN apt update && \
    apt install -y python3 \
                   python3-dev \
                   python3-pip  \
				   python3-numpy \
	pip3 install tqdm \
	apt-get install build-essential libssl-dev libffi-dev \
    pip3 install ujson \
	pip3 install -U spacy \
	python3 -m spacy download en \
	pip3 install -U nltk \
	pip3 install jieba \
					   
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


# 配置默认放置 App 的目录
RUN mkdir -p /app
WORKDIR /app
EXPOSE 80
CMD ["bash"]