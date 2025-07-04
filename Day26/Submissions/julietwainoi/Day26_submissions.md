 Day 26 Submission

## Personal Information
- **Name:** juliet wainoi
- **Date:** July 3 2025
- **GitHub Username:** julietwainoi

## Task Completion
- [x]I used Terraform modules for EC2, ELB, and Auto Scaling components.
 - [x]I stored Terraform state remotely in S3 and locked it with DynamoDB.
 - [x]I committed my changes regularly using version control.
 - [x]I deployed a scalable web application using EC2, ELB, and Auto Scaling.
## Infrastructure Details

### HCP  terraform
- **Region:** us-east-1
- **Key Features:** deploy vpc module in the private registry



## Blog Post
- **Title:** [Your Blog Post Title]
- **Link:** [URL to your blog post]

## Social Media
- **Platform:** [Twitter/LinkedIn]
- **Post Link:** [URL to your social media post]

## Notes and Observations
[Share your key learnings, challenges faced, and how you overcame them]

## Additional Resources Used
[List any additional resources you found helpful]

## Time Spent
- Reading:2 hours
- Infrastructure Deployment: 4hours
- Diagram Creation: hours
- Blog Writing: hours
- Total: 6 hours

## Repository Structure

Day26/
└── Submissions/
    └── julietwainoi/terraform
        ├── bootstrap
        │    └── main.tf
        ├── env/dev
        │    └── backend.tf
        │      └── main.tf
        │      └── terraform.tfvars
        │      └── variables.tf
        ├── modules/alb
        │    └── main.tf
        │    └── outputs.tf
        │    └── variables.tf
        ├── modules/asg
        │    └── main.tf
        │    └── outputs.tf
        │    └── variables.tf
        ├── modules/network
        │    └── main.tf
        │    └── outputs.tf
        │    └── variables.tf
        │ 
        └── Day26_submission.md
``` 