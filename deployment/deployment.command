aws s3 cp QrcodeDecoderLambda-1.0-SNAPSHOT-all.jar s3://healthychatbottranslate/QrcodeDecoderLambda-1.0-SNAPSHOT-all.jar
/usr/local/bin/node /usr/local/lib/node_modules/grunt-cli/bin/grunt --gruntfile ../Gruntfile.js lambda_package:awsLexInterceptor
aws s3 cp /Users/likw/Documents/GitHub/LexInterceptor-master/dist/LexInterceptor_latest.zip s3://healthychatbottranslate/LexInterceptor_latest.zip

aws cloudformation package \
    --region us-east-1\
    --template-file LexInterceptor.yaml \
    --s3-bucket healthychatbottranslate \
    --output-template-file LexInterceptor-packaged-template.yaml

aws cloudformation deploy \
    --region us-east-1\
    --capabilities CAPABILITY_IAM \
    --template-file /Users/likw/Documents/GitHub/LexInterceptor-master/deployment/LexInterceptor-packaged-template.yaml --stack-name LexInterceptor \
    --parameter-overrides \
    GoogleApiKey=%GoogleApiKey% \
    FacebookPageToken=%FacebookPageToken% \
    FacebookVerifyToken=%FacebookVerifyToken% \
    BotName=%BotName% \
    SourceBucket=healthychatbottranslate

