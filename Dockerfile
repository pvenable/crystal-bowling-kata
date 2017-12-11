FROM crystallang/crystal:0.23.1

COPY . /src
WORKDIR /src
RUN ./build.sh
