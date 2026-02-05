terraform {
    backend "s3" {
        bucket = "techbleatweek10b"
        key = "env/prod/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }
}