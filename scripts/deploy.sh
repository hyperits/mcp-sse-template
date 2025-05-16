#!/bin/bash

docker run -d \
  --name mcp-sse-weather \
  -p 18080:8080 \
  registry.cn-chengdu.aliyuncs.com/hpmr/mcp-sse:latest
