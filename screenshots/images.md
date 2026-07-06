AWS configure IAM user
<img width="1332" height="186" alt="image" src="https://github.com/user-attachments/assets/f2fe63b9-da9c-463a-9bac-8070bb268947" />

Cloning the repository
<img width="964" height="185" alt="image" src="https://github.com/user-attachments/assets/c659ca95-bf6b-48a6-9ff4-214b48506a96" />

creating the dockerfile
<img width="616" height="303" alt="image" src="https://github.com/user-attachments/assets/3cefb1e3-51f1-4cfb-9796-0809ac280c89" />

Building the Docker image 
<img width="713" height="777" alt="image" src="https://github.com/user-attachments/assets/02f89226-0189-4a00-8243-860989e1155a" />

Running the container locally to test Image created
<img width="1459" height="382" alt="image" src="https://github.com/user-attachments/assets/135a9b64-6f02-4d99-843b-16a885ab0bec" />

Creating a ECR Repo and EKS cluster with 2 nodes
<img width="1460" height="756" alt="image" src="https://github.com/user-attachments/assets/5f3b348f-fa33-4604-93e5-b8e35f53cfd3" />


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

```bash
docker build -t flask-app:v1 .
```

<img width="713" alt="Build Docker Image" src="https://github.com/user-attachments/assets/02f89226-0189-4a00-8243-860989e1155a" />

---

# Step 5: Run the Docker Container Locally

Run the Docker container locally to verify that the application works correctly.

```bash
docker run -d -p 5000:5000 flask-app:v1
```

Open your browser and verify the application by visiting:

```
http://localhost:5000
```

<img width="1459" alt="Run Docker Container" src="https://github.com/user-attachments/assets/135a9b64-6f02-4d99-843b-16a885ab0bec" />

---

# Step 6: Create an Amazon ECR Repository

Create an Amazon Elastic Container Registry (ECR) repository to store Docker images.

---

# Step 7: Create an Amazon EKS Cluster

Create an Amazon EKS cluster with **2 worker nodes** to deploy the application.

<img width="1460" alt="ECR and EKS Cluster" src="https://github.com/user-attachments/assets/5f3b348f-fa33-4604-93e5-b8e35f53cfd3" />

---

## ✅ Project Workflow

1. Configure AWS CLI
2. Clone the GitHub Repository
3. Create the Dockerfile
4. Build the Docker Image
5. Test the Docker Container Locally
6. Create an Amazon ECR Repository
7. Create an Amazon EKS Cluster with 2 Worker Nodes
8. Push Docker Image to Amazon ECR
9. Deploy the Application on Amazon EKS
10. Verify the Deployment
