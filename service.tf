resource "aws_ecs_cluster" "miami" {
  name = "miami"
}

data "aws_ecs_task_definition" "miami" {
  task_definition = "miami"
}

resource "aws_ecs_service" "miami" {
  name            = "miami"
  cluster         = aws_ecs_cluster.miami.id
  task_definition = "${data.aws_ecs_task_definition.miami.family}:${data.aws_ecs_task_definition.miami.revision}"
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [
      "subnet-1bc7da7c"
    ]
  }

  lifecycle {
    ignore_changes = ["task_definition"]
  }
}