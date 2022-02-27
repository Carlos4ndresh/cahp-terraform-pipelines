data "aws_codestarconnections_connection" "github_connection" {
  arn = "arn:aws:codestar-connections:us-east-1:982656938909:connection/633ca6f5-e69f-439a-b3fb-6556533ff285"
}

data "aws_iam_policy_document" "codepipeline_ami_assume_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name               = "ami-packer-codepipeline-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_ami_assume_policy.json
}

resource "aws_s3_bucket" "ami_pipeline_artifact_store" {
  bucket        = "ami-packer-pipeline-artifact-store"
  acl           = "private"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block_all_artifact_bucket" {
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
  bucket                  = aws_s3_bucket.ami_pipeline_artifact_store.id
}


resource "aws_codepipeline" "ami_pipeline" {
  name     = "ami-packer-demo-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn
  artifact_store {
    location = aws_s3_bucket.ami_pipeline_artifact_store.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = data.aws_codestarconnections_connection.github_connection.arn
        BranchName       = "main"
        FullRepositoryId = "Carlos4ndresh/typical_ami_packer_repo"
      }

    }
  }

}
