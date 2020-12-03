resource "aws_iam_group" "developers" {
    name = "developers"
}

resource "aws_iam_policy_attachment" "developers_attach" {
    name = "developers_attach"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    groups = [aws_iam_group.developers.name] 
}

resource "aws_iam_user" "dev1" {
    name = "dev1" 
}

resource "aws_iam_user" "dev2" {
    name = "dev2" 
}

resource "aws_iam_group_membership" "developers-users" {
    name = "dev-user"
    users = [
        aws_iam_user.dev1.name,
        aws_iam_user.dev2.name
    ]
    group = "aws_iam_group.developers.name"  
}

output "warning" {
    value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}