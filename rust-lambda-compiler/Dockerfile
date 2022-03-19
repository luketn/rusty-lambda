FROM amazonlinux:2
RUN yum install -y gcc
RUN curl -o /rustup.sh --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs
RUN bash /rustup.sh -y
ENV PATH="/root/.cargo/bin:${PATH}"
WORKDIR /code/ 
ENTRYPOINT [ "/root/.cargo/bin/cargo" ]