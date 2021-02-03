FROM golang:1.15.7-buster

# Setup

# if you prefer cloning the repo by yourself 
# copy this file at the root of its repository
# and swap the RUN with the COPY
# COPY . .

WORKDIR /go/src/app
RUN git clone https://git.sr.ht/~yerinalexey/gtranslate /go/src/app

# Build
RUN go build

# Serve

# Pay attention to the : added at the start of the variable:
# this way LISTEN_PORT can be set from docker/compose as a simple number instead of :5000 
ENV LISTEN_PORT=:${LISTEN_PORT:-5000}
ENV PROXY=${PROXY:-"http://localhost:5000"}
ENV STATIC_DIR=${STATIC_DIR:-"./static"}
ENV TEMPLATES_DIR=${TEMPLATES_DIR:-"./templates"}
ENV USER_AGENT=${USER_AGENT:-"Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0"}

CMD ["sh", "-c", "/go/src/app/gtranslate", "--bind ${LISTEN_PORT}", "--proxy ${PROXY}", "--static-dir ${STATIC_DIR}", "--templates-dir ${TEMPLATES_DIR}", "--user-agent=${USER_AGENT}"]
