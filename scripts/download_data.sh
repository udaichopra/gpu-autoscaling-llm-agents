#!/bin/bash
mkdir -p data/raw
cd data/raw
curl -fL -O https://tre-clusterdata.oss-cn-hangzhou.aliyuncs.com/cluster-trace-v2026-maas/data/app_metrics.csv.zip
unzip -o app_metrics.csv.zip
