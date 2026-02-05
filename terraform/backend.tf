terraform {
    backend "s3" {
        bucket = "techbleatweek"
        key = "env/prod/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }
}