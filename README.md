docker-alpine-anon-proxy
========================

Docker image with Tor and 3proxy based on [Alpine Linux](https://github.com/gliderlabs/docker-alpine)

## Usage

Run docker container with passed **PROXY_LIST** environment variable
which contains comma separated list of proxies.

Proxy list format:

    protocol IP port username password

e.g. `socks5 100.10.10.10 1080`


username and password are optional. 


    docker run -e PROXY_LIST="socks5 16.88.18.50 1080 vasia passw0rd, http 140.227.70.68 3128" \
               -p 0.0.0.0:3128:3128 \
               --name alpine-anon-proxy --rm \
               alpine-anon-proxy


## How it works

   
             
             
                                             random next hop
                                        ╔═══════════════════════╗      │ I
                                    → → ║http or socks proxy #1 ║ → →  │ N
                                 ↑      ╚═══════════════════════╝      │ T
    ╔═════════╗    ╔═════════╗   │      ╔═══════════════════════╗      │ E
    ║your host║── →║  T o r  ║───┼─ → → ║http or socks proxy #2 ║ → →  │ R
    ╚═════════╝    ╚═════════╝   │      ╚═══════════════════════╝      │ N
                                 ↓      ╔═══════════════════════╗      │ E
                                    → → ║http or socks proxy #N ║ → →  │ T
                                        ╚═══════════════════════╝      │ 
