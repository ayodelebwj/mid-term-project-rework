terraform {
    backend "s3" {
        bucket = "techbleatweek8"
        key = "env/prod/terraform.statefile"
        region = "us-east-2"
        encrypt = true
    }
}