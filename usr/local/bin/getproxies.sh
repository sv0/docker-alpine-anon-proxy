#!/bin/sh
test -z "$PROXY_LIST" && exit 0
echo "$PROXY_LIST" \
    | tr ',' '\n' \
    | sed 's/^\s*//' \
    | grep -E "^(http|socks[4-5])\s{1,4}(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\s{1,4}[0-9]{1,5}($|(\s{1,4}([0-9a-zA-Z]{1,20}\s{0,1}){2}))" \
    | xargs -n1 -I{} echo "parent 100 " {}
# TODO add posibility to create a few hops
