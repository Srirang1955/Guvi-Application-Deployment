# Flask Application Deployment on AWS EKS using CI/CD Pipeline

## Project Overview

In this project, I have deployed a Flask application on an Amazon EKS (Elastic Kubernetes Service) cluster using a complete CI/CD pipeline.

The main goal of this project was to automate the deployment process. Whenever changes are pushed to the GitHub repository, the pipeline automatically builds the Docker image, pushes it to Amazon ECR and deploys the latest image to the Kubernetes cluster without any manual intervention.

This project helped me understand how different AWS services work together in a real DevOps workflow and how CI/CD pipelines are implemented in production environments.

---

# Architecture

GitHub
↓

CodePipeline

↓

CodeBuild

↓

Docker Build

↓

Amazon ECR

↓

Amazon EKS

↓

Kubernetes Deployment

↓

LoadBalancer Service

↓

Application Accessible through Browser

---

# AWS Services Used

### Amazon EKS

Amazon Elastic Kubernetes Service is used to manage and run the Kubernetes cluster where the application is deployed.

---

### Amazon ECR

Amazon Elastic Container Registry is used to store Docker images.

Every successful build pushes the latest Docker image to this repository.

---

### AWS CodePipeline

CodePipeline is responsible for automating the complete deployment process.

Whenever a new commit is pushed to GitHub, CodePipeline automatically starts the deployment pipeline.

---

### AWS CodeBuild

CodeBuild performs the following tasks:

- Downloads source code from GitHub
- Builds Docker image
- Logs in to Amazon ECR
- Pushes Docker image to ECR
- Updates kubeconfig
- Deploys latest image to EKS

---

### IAM

IAM Roles and Policies are used to provide the required permissions to CodeBuild so it can access ECR and EKS securely.

---

# Technologies Used

- Python
- Flask
- Docker
- Kubernetes
- AWS EKS
- AWS ECR
- AWS CodePipeline
- AWS CodeBuild
- Git
- GitHub

---

# Repository Structure
