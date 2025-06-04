# Day 7 Submission

## Personal Information
- **Name:** Juliet Wainoi
- **Date:** 4th June 2025
- **GitHub Username:** julietwainoi

## Task Completion
- [x]  I have completed Chapter 3 of "Terraform: Up & Running".
- [x] I have completed the required hands-on labs
- [x] I have successfully configured state isolation using both  Workspaces and File Layout methods.
- [x] I have configured remote state storage and state locking as part of the Bonus Hands-On Project.
- [x] I have written and published a blog post about today's task.
- [x] I have made a social media post about today's task.
- [] I have created a day7-update-your-github-username.md file with my Terraform code and architecture diagrams.
- [] I have created a pull request with all the required details

## Infrastructure Details

### Workspace Deployment
- **Key Features:** bucket = "my-app-${terraform.workspace}-bucket"

### file-layout Deployment
- **Key Features:** div(main.tf),prod(main.tf),modules/s3(bucket.tf)
                    - each main.tf has a .tfstate file.
## Infrastructure Diagrams
Please place your infrastructure diagrams in the `architecture` folder with the following files:
- `remote archecture.png` - Diagram for the single server deployment

## Blog Post
- **Title:** [Your Blog Post Title]
- **Link:** [URL to your blog post]



## Notes and Observations
it is better to have the remote setup if you are doing the project as a team otherwise if it is a personal project file-layout will do.

## Additional Resources Used
terraform cloud how to create organization,i'm still learning on this for remote state management.

## Time Spent
- Reading: 2 hours
- Infrastructure Deployment: 1 hours
- Diagram Creation: 0.5 hours
- Blog Writing: 0.5 hours
- Total: 4 hours

## Repository Structure
```
Day7/
└── Submissions/
    └── julietwainoi/
        ├── terraform/
        │     ├── archtecture
        │     ├       └── remote archecture.png
        │     ├── file-layout
        │     │   │
        │     │   ├──dev
        │     │   │   └── main.tf
        │     │   ├── prod
        │     │         └── main.tf
        │     ├── workspace
        │     │      └── main.tf
        │     │ 
        ├     │── remote
        │          └── backend-setup.tf
        │          └── main.tf
        │          └── outputs.tf
        │  
        │       
        └── Day7_submission.md
``` 



