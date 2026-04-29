# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Oxc](https://oxc.rs)
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/)

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the ESLint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.

## 🚀 CI/CD Pipeline & Security

This project implements a fully automated development lifecycle using GitHub Actions. Every push to the main branch triggers a comprehensive multi-stage pipeline:
### 🛡️ Security & Quality Gates

    Gitleaks: Automatically scans the repository for exposed secrets, API keys, or passwords.

    Hadolint: Validates the Dockerfile against best practices for optimization and security.

    Trivy Scan: Performs a deep vulnerability scan (CVE) of the assembled Docker image before deployment.

    ESLint: Ensures code quality and syntax consistency.

### 🏗️ Deployment Flow

    Build: The application is built using pnpm and packaged into a Docker container.

    Artifact Registry: The image is automatically pushed to Google Cloud Artifact Registry, tagged with the specific Git commit SHA.

    Cloud Run: Fully automated deployment to a serverless environment on Google Cloud Platform.

    Workload Identity Federation: Secure, keyless authentication to Google Cloud, eliminating the need for static JSON Service Account keys.

### 🧪 Testing Strategy

    Unit Tests: Component testing is executed before the container build phase to ensure logic integrity.

    Smoke Test: A post-deployment check is performed using curl to verify service availability (HTTP 200 OK) at the live endpoint.