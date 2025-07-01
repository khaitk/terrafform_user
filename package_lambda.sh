#!/bin/bash
mkdir -p dist

cd lambda_function
zip -r ../dist/lambda_function.zip .
cd ..

echo "Lambda function zip success: dist/lambda_function.zip"
