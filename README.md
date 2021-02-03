# gtranslate, dockerized

This is a simple container for a Go app I made to dockerize this interesting app. It has not been fully tested. Check out the official git repo for more info on parameters etc.

Official description: "Better front-end for Google Translate that doesn't track you and works without JavaScript."

Official git repository [here](https://git.sr.ht/~yerinalexey/gtranslate)

### Installation

1. Clone this repo
2. Check if the default parameters are ok
3. Remove the comments from the ports section if you want to expose it via a port or leave it if you want to use a reverse proxy 
4. Run `docker-compose up -d`

#### Reverse proxy
This app does not require a special setup. If you're using caddy it's as simple as 

```
gtranslate.example.com {
  reverse_proxy  your_container_name:5000
}
```

`docker ps | grep gtranslate` can be used to find out your container name

### Tor

Tor has not been tested yet, it will be sometime in the future. If you want to try it by yourself you should be able to add a tor container to the  `docker-compose.yml` file following the [official instructions](https://community.torproject.org/relay/setup/bridge/docker/) and change PROXY to `socks5://tor-container:tor-port`, getting something like `PROXY=socks5://obfs4-bridge:9050`.
