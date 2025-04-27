# 使用基础镜像
FROM ubuntu:18.04

# 设置镜像名称
LABEL name="bupt-compiler"

# 设置时区
ENV TZ=Asia/Shanghai

# 更换apt源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 更新包管理器和安装软件
RUN apt-get update && \
    apt-get install -y gcc=4:7.4.0-1ubuntu2.3 \
                       make=4.1-9.1ubuntu1 \
                       python3=3.6.7-1~18.04 \
                       flex=2.6.4-6 \
                       bison=2:3.0.4.dfsg-1build1 \
                       python3-pip=9.0.1-2.3~ubuntu1.18.04.8 \
                       vim tree tmux htop

# logo
COPY ./logo.txt /root/logo.txt
RUN cat /root/logo.txt >> ~/.bashrc 

# 定义容器启动时运行的命令
# CMD ["uname -a"]
ENTRYPOINT ["/bin/bash"]
