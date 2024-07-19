FROM ubuntu:latest

ADD . /service

WORKDIR /service/utility

# Install necessary dependencies
RUN apt-get update && apt-get install -y \    
    git \
    cmake \
    build-essential
    

RUN ./install-oatpp-modules.sh

WORKDIR /service/build

RUN cmake ..
RUN make

EXPOSE 8080 8080

ENTRYPOINT ["./my-project-exe"]
