terraform {
    backend "s3" {
        bucket = "bucket-name"
        key = "tarraform/backup"
        region = "us-west-2"
    }
}

# aws cli must install in server
# aws configure to access s3