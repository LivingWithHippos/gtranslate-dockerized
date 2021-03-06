# gtranslate, dockerized

Official description: "Better front-end for Google Translate that doesn't track you and works without JavaScript."

This is a simple image I made for an interesting Go app. It has not been fully tested. Check out the official git repo for more info on parameters etc.

Official git repository [here](https://git.sr.ht/~yerinalexey/gtranslate)

Notice: the project may have been deprecated in favor of [simplytranslate](LivingWithHippos/simplytranslate-dockerized).

### Installation

1. Clone this repo
2. Check if the default parameters are ok
3. Remove the comments from the ports section if you want to expose it via a port or leave it if you want to use a reverse proxy 
4. Run `docker-compose build --no-cache` to avoid the docker caching mechanism skipping the git clone step and miss new commits
5. Run `docker-compose up -d`

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

### Updates

1. Run `docker-compose build --no-cache` to avoid the docker caching mechanism skipping the git clone step and miss new commits
2. Run `docker-compose up -d`

