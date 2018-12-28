docker-alpine-anon-proxy
========================

Docker image with Tor and 3proxy based on [Alpine Linux](https://github.com/gliderlabs/docker-alpine)

## Usage

Run docker container with passed **PROXY_LIST** environment variable
which contains comma separated list of proxies.

Proxy list format:

    <protocol> <IP> <port> [username] [password]


e.g. `socks5 100.10.10.10 1080`

Protocol, IP address and port are required.

Username and password are optional. 


    docker run -e PROXY_LIST="socks5 192.168.1.1 1080 username passwd, http 10.0.0.1 3128" \
               -p 0.0.0.0:3128:3128 \
               --name alpine-anon-proxy --rm \
               slavik0/docker-alpine-anon-proxy:latest


## How it works

                                                random hop
                                        ╔═══════════════════════╗      │ I
                                    → → ║http or socks proxy #1 ║ → →  │ N
                                 ↑      ╚═══════════════════════╝      │ T
    ╔═════════╗    ╔═════════╗   │      ╔═══════════════════════╗      │ E
    ║your host║── →║  T o r  ║───┼─ → → ║http or socks proxy #2 ║ → →  │ R
    ╚═════════╝    ╚═════════╝   │      ╚═══════════════════════╝      │ N
                                 ↓      ╔═══════════════════════╗      │ E
                                    → → ║http or socks proxy #N ║ → →  │ T
                                        ╚═══════════════════════╝      │ 
