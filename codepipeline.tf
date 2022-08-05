resource "aws_codepipeline" "codepipeline1" {
  name     = "${var.projectname1}-pipeline"
  role_arn = aws_iam_role.codepipeline_role1.arn

  artifact_store {
    location = aws_s3_bucket.pipeline_bucket.bucket
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
      output_artifacts = ["SourceArtifact"]
      #PollForSourceChanges = true

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.easydeploy_github.arn
        FullRepositoryId = var.repo1_id
        BranchName       = var.repo1_branch_name
        #PollForSourceChanges = true
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.codebuild1.name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["BuildArtifact"]
      version         = "1"

      configuration = {
        "BucketName" = aws_s3_bucket.app_bucket.bucket
        "Extract"    = "true"
      }
    }
  }
}