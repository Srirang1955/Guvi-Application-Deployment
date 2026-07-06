# 🚀 Flask Application Deployment on AWS EKS using Docker & Amazon ECR

This project demonstrates the complete deployment workflow of a Flask application using Docker, Amazon ECR, and Amazon EKS.

---

# Step 1: Configure AWS CLI with IAM User

Configure the AWS CLI using IAM user credentials.

```bash
aws configure
```

<img width="1332" alt="AWS Configure" src="https://github.com/user-attachments/assets/f2fe63b9-da9c-463a-9bac-8070bb268947" />

---

# Step 2: Clone the GitHub Repository

Clone the project repository to your local machine.

```bash
git clone <repository-url>
cd <repository-name>
```

<img width="964" alt="Clone Repository" src="https://github.com/user-attachments/assets/c659ca95-bf6b-48a6-9ff4-214b48506a96" />

---

# Step 3: Create the Dockerfile

Create a Dockerfile to containerize the Flask application.

<img width="616" alt="Dockerfile" src="https://github.com/user-attachments/assets/3cefb1e3-51f1-4cfb-9796-0809ac280c89" />

---

# Step 4: Build the Docker Image

Build the Docker image from the Dockerfile.

<img width="713" alt="Build Docker Image" src="https://github.com/user-attachments/assets/02f89226-0189-4a00-8243-860989e1155a" />

---

# Step 5: Run the Docker Container Locally

Run the Docker container locally to verify that the application works correctly.

Open your browser and verify the application by visiting:

<img width="1459" alt="Run Docker Container" src="https://github.com/user-attachments/assets/135a9b64-6f02-4d99-843b-16a885ab0bec" />

---

# Step 6: Create an Amazon ECR Repository

Create an Amazon Elastic Container Registry (ECR) repository to store Docker images.

---

# Step 7: Create an Amazon EKS Cluster

Create an Amazon EKS cluster with **2 worker nodes** to deploy the application.

<img width="1460" alt="ECR and EKS Cluster" src="https://github.com/user-attachments/assets/5f3b348f-fa33-4604-93e5-b8e35f53cfd3" />

<img width="1455" alt="ECR and EKS Cluster" src="https://github.com/user-attachments/assets/643454c3-e0f5-4cbe-8ea6-1dc8aa3bddf5" />

---

# Step 8: create deployment and service YAML files

<img width="714" alt="deployment and serivce files" src="https://github.com/user-attachments/assets/017cadb0-b687-44f3-8251-63a5218caba1" />

# Step 9: create a buildspec.yml file

<img width="1373" alt="buildspec yml file" src="https://github.com/user-attachments/assets/1838f4e0-dd94-4ee6-87a7-b1b52dae0f89" />

