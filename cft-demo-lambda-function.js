/**
 * Created by akumar13 on 3/16/17.
 */
'use strict';

class CFTDemoLambdaHandler {
    /*
     * Lambda Handler Function
     */
    handler(event) {
        if (event.Records && event.Records.length > 0) {
            let record = event.Records[0];
            if (record.EventSource === "aws:sns") {
                let snsMessage = record.Sns.Message;
                snsMessage = JSON.parse(snsMessage);
                let s3Object = snsMessage.Records[0].s3;
                console.info('Bucket:', s3Object.bucket.name, "Key:", s3Object.object.key);
            }
        }
    }
}

exports.handler = new CFTDemoLambdaHandler().handler;