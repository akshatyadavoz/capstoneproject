#!/bin/bash
set -e
curl -f http://localhost:5000/health
echo "App health check passed"
