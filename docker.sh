#!/bin/sh

cd /news-please/newsplease
curl \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{ "query": "{ allConfigs { data } }" }' \
  https://api.graph.cool/simple/v1/cjcol6bod1cuh0170hkw0xf51 | \
  python3 \
    -c "import sys, json; print(json.dumps(json.load(sys.stdin)['data']['allConfigs'][0]['data']))" > \
    ./config/remoteSitelist.json
python3 __main__.py -c ./config