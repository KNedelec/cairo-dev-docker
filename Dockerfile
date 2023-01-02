FROM debian:11

RUN apt update
RUN apt install -y curl make libgmp3-dev g++ python3-pip python3.9-dev python3.9-venv cmake npm
RUN pip install cairo-lang

RUN curl https://binaries.soliditylang.org/linux-amd64/solc-linux-amd64-v0.6.12+commit.27d51765 -o /usr/local/bin/solc-0.6.12
RUN echo 'f6cb519b01dabc61cab4c184a3db11aa591d18151e362fcae850e42cffdfb09a /usr/local/bin/solc-0.6.12' | sha256sum --check
RUN chmod +x /usr/local/bin/solc-0.6.12
RUN npm install -g --unsafe-perm ganache@7.4.3

WORKDIR /app

COPY . .

