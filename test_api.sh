#!/bin/bash

# Lấy API URL từ output của Terraform
API_URL=$(terraform output -raw api_gateway_url)

if [ -z "$API_URL" ]; then
    echo "Không thể lấy API URL. Hãy đảm bảo bạn đã triển khai thành công với Terraform."
    exit 1
fi

echo "API URL: $API_URL"
echo "-------------------------------------"

# Test endpoint root
echo "Testing root endpoint (GET /):"
curl -s $API_URL | jq
echo "-------------------------------------"

# Test endpoint items (GET)
echo "Testing items endpoint (GET /items):"
curl -s $API_URL/items | jq
echo "-------------------------------------"

# Test endpoint items (POST)
echo "Testing items endpoint (POST /items):"
curl -s -X POST \
  $API_URL/items \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Test Item",
    "description": "This is a test item"
  }' | jq
echo "-------------------------------------"

# Test endpoint status
echo "Testing status endpoint (GET /status):"
curl -s $API_URL/status | jq
echo "-------------------------------------"
