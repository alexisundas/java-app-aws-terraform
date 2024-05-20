provider "aws" {
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
    session_token = var.aws_session_token
    region     = var.aws_region
}