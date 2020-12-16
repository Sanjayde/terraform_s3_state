provider "aws" {
    region         = "ap-south-1"
    
}

resource "aws_s3_bucket" "my_bucky" {
    bucket = "fornewstate"
    acl    = "private"

    lifecycle {
        prevent_destroy = true
    }
    versioning {
        enabled = true
    }

    tags = {
        Name        = "my_buck"
    }
} 
resource "aws_dynamodb_table" "forstate" {
    name    = "for_state_lock"
    hash_key    = "LockID"
    read_capacity   = "8"
    write_capacity  = "8"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name    = "StateLock"
    }
    depends_on = [aws_s3_bucket.my_bucky]
}