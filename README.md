# Node Hello App – DevOps CI/CD Pipeline Assignment

This project contains a simple "Hello World" Node.js application cloned from [johnpapa/node-hello](https://github.com/johnpapa/node-hello), containerized using Docker and deployed via a GitHub Actions CI/CD pipeline. The container is built, pushed to Docker Hub, and deployed using Terraform.

---

## Tech Stack

- Node.js
- Docker
- GitHub Actions (`ci-cd.yml`)
- Docker Hub
- Terraform

---

##  CI/CD Pipeline Overview

The CI/CD pipeline is defined in `.github/workflows/ci-cd.yml`. It runs automatically on every push or pull request to the `master` branch and performs the following:

1. Checkout the code
2. Set up Node.js environment and install dependencies
3. Run code linting using Super-Linter
4. Build the Docker image
5. Log in to Docker Hub
6. Push the image to Docker Hub
7. Set up Terraform
8. Deploy the application using `terraform apply`
9. Wait for the app to start
10. Test the app with a `curl` command

---

##  How to Set Up and Run the Pipeline

### 1. Fork or Clone the Repository

```bash
git clone https://github.com/karimson3/node-hello.git
cd node-hello

### 2. Set Up GitHub Secrets

Go to your GitHub repository → Settings → Secrets and variables → Actions, and add the following secrets:
DOCKER_USERNAME   	Your Docker Hub username
DOCKER_PASSWORD    	Your Docker Hub password
DOCKER_TOKEN	      Your GitHub personal access token (used by Super-Linter)

These are required for authenticating Docker operations and running the linter.

### 3. Commit and Push Changes

```bash
git add .
git commit -m "Trigger pipeline"
git push origin master

This will automatically trigger the GitHub Actions workflow defined in .github/workflows/ci-cd.yml

### 4. Monitor the Pipeline

Go to the Actions tab in your GitHub repository to monitor the workflow execution and logs.

---

### To test the app manually:

```bash
docker build -t node-hello .
docker run -p 3000:3000 node-hello

Then visit: http://localhost:3000

