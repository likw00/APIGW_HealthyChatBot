/usr/local/bin/node /usr/local/lib/node_modules/grunt-cli/bin/grunt --gruntfile ../Gruntfile.js lambda_package:awsLexInterceptor
aws s3 cp /Users/likw/Documents/GitHub/FYP_API/LexInterceptor/dist/LexInterceptor_latest.zip s3://healthychatbottranslate/LexInterceptor_latest.zip

aws lambda update-function-code --function-name LexInterceptor-FacebookLexInterceptorFunction-16Z5BH1WZVBZ3 --s3-bucket healthychatbottranslate --s3-key LexInterceptor_latest.zip