terraform {
    backend "s3" {
        bucket = "shaheen-balti-1"  # provide the s3 bucket name
        key = "tarraform/backup"
        region = "ap-south-1"
        access_key = "AKIAYH7GG6GJIBRBKZSH"
        secret_key = "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"
    }
}

# aws cli must install in server
# aws configure to access s3