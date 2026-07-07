I agree. The previous README is technically correct, but it reads like documentation. For a project submission or GitHub portfolio, you want it to sound like **you are explaining what you built, why you chose each AWS service, and how everything works together**. It should also show that you understand the implementation, not just the commands.

Below is a more detailed version that matches your writing style.

---

# Flask Application Deployment on AWS EKS using CI/CD Pipeline

## Project Overview

This project demonstrates the deployment of a Python Flask application on an Amazon EKS (Elastic Kubernetes Service) cluster using a fully automated CI/CD pipeline on AWS.

The objective of this project was to understand how modern applications are built, containerized, stored, and deployed automatically without any manual deployment steps. Instead of manually building Docker images and deploying them to Kubernetes after every code change, the complete deployment process is automated using AWS CodePipeline and AWS CodeBuild.

Whenever changes are pushed to the GitHub repository, the pipeline is automatically triggered. It downloads the latest source code, builds a Docker image, pushes it to Amazon ECR, connects to the EKS cluster, and deploys the latest version of the application to Kubernetes.

Working on this project gave me practical experience with Docker, Kubernetes, Amazon EKS, Amazon ECR, IAM Roles, AWS CodePipeline, AWS CodeBuild and troubleshooting CI/CD pipeline issues.

---

# Project Architecture

```
Developer
     │
     ▼
GitHub Repository
     │
     ▼
GitHub Webhook
     │
     ▼
AWS CodePipeline
     │
     ▼
AWS CodeBuild
     │
     ├────────► Build Docker Image
     │
     ├────────► Login to Amazon ECR
     │
     ├────────► Push Docker Image
     │
     ├────────► Connect to Amazon EKS
     │
     └────────► Deploy using kubectl
                      │
                      ▼
          Amazon EKS Cluster
                      │
                      ▼
      Kubernetes Deployment
                      │
                      ▼
      Kubernetes Service (LoadBalancer)
                      │
                      ▼
         Application Accessible
```

---

# AWS Resources Used

## 1. GitHub Repository

The complete source code of the project is stored in a GitHub repository. GitHub acts as the source stage of the CI/CD pipeline.

Whenever I push new code to the repository, GitHub sends a webhook event to AWS CodePipeline. This automatically starts a new pipeline execution without requiring any manual trigger.

The repository contains:

* Flask application
* Dockerfile
* Kubernetes manifests
* buildspec.yml
* README documentation

---

## 2. AWS CodePipeline

AWS CodePipeline is responsible for orchestrating the complete deployment workflow.

Instead of manually running Docker commands and Kubernetes commands after every code change, CodePipeline automates the entire process.

The pipeline consists of two stages:

### Source Stage

The Source stage is connected to my GitHub repository using GitHub OAuth. Whenever code is pushed to the main branch, CodePipeline automatically downloads the latest version of the source code.

### Build Stage

After downloading the source code, CodePipeline triggers AWS CodeBuild, which performs the remaining deployment tasks.

Using CodePipeline helped me understand how automated deployments are implemented in real-world DevOps projects.

---

## 3. AWS CodeBuild

AWS CodeBuild performs all the deployment operations defined inside the **buildspec.yml** file.

The build process is divided into three phases.

### Pre-Build Phase

During this phase, CodeBuild authenticates with Amazon ECR using AWS CLI.

It generates a temporary authentication token and logs Docker into the ECR registry so that Docker images can be pushed securely.

It also prepares variables like:

* AWS Account ID
* AWS Region
* ECR Repository URI
* Image Tag

---

### Build Phase

In this phase, CodeBuild builds the Docker image using the Dockerfile present in the repository.

Example command:

```bash
docker build -t $REPOSITORY_URI:latest .
```

After building the image, it is tagged with both the latest tag and the Git commit hash. Tagging with the commit hash makes it easier to identify which version of the application is deployed.

---

### Post-Build Phase

During the final phase, CodeBuild:

* Pushes the Docker image to Amazon ECR.
* Updates kubeconfig to connect with the EKS cluster.
* Applies the Kubernetes Deployment manifest.
* Applies the Kubernetes Service manifest.
* Updates the running deployment with the latest Docker image.

This completes the deployment without any manual intervention.

---

# Amazon Elastic Container Registry (ECR)

Amazon ECR is used as the private Docker image repository.

Instead of storing Docker images locally, every successful build pushes the latest application image into ECR.

Whenever Kubernetes creates new pods, it pulls the required Docker image directly from this repository.

This ensures that all Kubernetes pods always use the latest application image generated by the CI/CD pipeline.

---

# Amazon Elastic Kubernetes Service (EKS)

Amazon EKS hosts the Kubernetes cluster where the application is deployed.

Instead of running containers manually on EC2 instances, Kubernetes manages container scheduling, scaling, networking and application availability automatically.

The EKS cluster contains worker nodes that execute the application containers.

During deployment, CodeBuild connects to the cluster using:

```bash
aws eks update-kubeconfig
```

After connecting successfully, Kubernetes commands are executed to deploy the application.

---

# Kubernetes Deployment

The Deployment manifest defines how the application should run inside the cluster.

The deployment specifies:

* Number of replicas
* Docker image to pull
* Container port
* Labels and selectors
* Restart policy

Using Deployments ensures that Kubernetes continuously monitors the application. If a pod crashes, Kubernetes automatically creates a replacement pod to maintain the desired state.

---

# Kubernetes Service

A Kubernetes Service is used to expose the application outside the cluster.

I have used a Service of type **LoadBalancer**.

When the Service is created, AWS automatically provisions an Elastic Load Balancer and assigns a public DNS endpoint.

Users can access the Flask application through this Load Balancer without needing to know the IP addresses of individual pods.

The Service also distributes incoming requests across all available application pods, improving availability and reliability.

---

# Docker

Docker is used to containerize the Flask application.

The Dockerfile defines:

* Base Python image
* Working directory
* Application source code
* Python dependencies
* Exposed application port
* Startup command

Containerization ensures that the application behaves consistently across development, testing and production environments.

---

# IAM Roles

IAM Roles are used to securely allow AWS services to communicate with each other.

During implementation, I configured IAM permissions so that CodeBuild could:

* Authenticate with Amazon ECR
* Push Docker images
* Describe the EKS cluster
* Update kubeconfig
* Deploy Kubernetes resources

While implementing the project, I encountered IAM permission issues during deployment, particularly with EKS access. Resolving these issues helped me better understand how AWS IAM controls access between services.

---

# CI/CD Workflow

The complete deployment process follows these steps:

1. Developer pushes code changes to GitHub.
2. GitHub automatically triggers AWS CodePipeline through a webhook.
3. CodePipeline downloads the latest source code.
4. CodeBuild starts executing the buildspec.yml file.
5. Docker builds the application image.
6. Docker authenticates with Amazon ECR.
7. The image is pushed to the private ECR repository.
8. CodeBuild updates the Kubernetes configuration using the EKS cluster.
9. Kubernetes Deployment is updated with the latest image.
10. Kubernetes creates new pods using the latest Docker image.
11. The Kubernetes LoadBalancer exposes the application, making it accessible through the browser.

---

# Challenges Faced

During this implementation, I encountered several real-world issues while configuring the CI/CD pipeline.

Some of the major challenges included:

* Incorrect AWS region configuration causing Docker image push failures.
* Incorrect ECR repository URI configuration.
* Missing IAM permissions for CodeBuild while accessing Amazon EKS.
* Configuring CodeBuild to authenticate with the Kubernetes cluster.
* Verifying Kubernetes deployments and services after successful deployment.

Resolving these issues helped me gain practical troubleshooting experience with AWS services and understand how different components of a CI/CD pipeline interact with each other.

---
