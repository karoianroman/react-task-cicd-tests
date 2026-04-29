# React CI/CD & DevSecOps Showcase

A professional demonstration of a secure, automated pipeline for deploying React applications to **Google Cloud Platform (GCP)** using **GitHub Actions**.

## 🚀 Pipeline Overview

This repository implements a robust **DevSecOps** flow. Every push to `main` or `master` triggers a multi-stage process to ensure container security and reliable delivery to **Cloud Run**.

## 🛠 Tech Stack
- **Frontend:** React, Vite, pnpm
- **Cloud:** Google Cloud Run, Artifact Registry
- **CI/CD:** GitHub Actions
- **Security Tools:** Gitleaks, Hadolint, Trivy

---

## 🏗 CI/CD Workflow Stages

### 1. 🛡️ Security & Quality Checks
* **Gitleaks:** Scans repository history for accidentally committed secrets or API keys.
* **Hadolint:** Analyzes the `Dockerfile` to ensure it follows security and optimization best practices.
* **ESLint:** Runs `pnpm lint` to maintain code style and catch potential bugs early.

### 2. 📦 Container Management
* **Build & Push:** Uses Docker to package the application and pushes it to **GCP Artifact Registry** with a unique tag (Commit SHA).
* **Workload Identity Federation:** Connects GitHub to GCP securely without static JSON keys.

### 3. 🛡️ Image Auditing
* **Trivy Scan:** Performs a deep vulnerability scan on the final Docker image. The pipeline will fail if **CRITICAL** or **HIGH** vulnerabilities are detected.

### 4. 🚀 Cloud Deployment
* **Cloud Run:** Automatically deploys the container to a serverless environment in the `europe-west1` region.
* **Verification (Smoke Test):** Once deployed, the pipeline runs a `curl` command against the live URL to verify that the service is up and responding (HTTP 200).

---

## 🚦 How to Run Locally

1. **Install dependencies:**
   ```bash
   pnpm install

    Start development server:
    Bash

    pnpm dev

    Build Docker image:
    Bash

    docker build -t react-app .