# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Oxc](https://oxc.rs)
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/)

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the ESLint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.

🚀 CI/CD Pipeline & Security

Цей проєкт використовує автоматизований цикл розробки через GitHub Actions. Кожен Push у гілку main запускає наступні етапи перевірки:
🛡️ Security & Quality Gates

    Gitleaks: Автоматичний пошук забутих секретів, API-ключів або паролів у коді.

    Hadolint: Перевірка Dockerfile на відповідність кращим практикам оптимізації та безпеки.

    Trivy Scan: Глибоке сканування зібраного Docker-образу на наявність вразливостей (CVE) перед деплоєм.

    ESLint: Перевірка якості коду та синтаксису.

🏗️ Deployment Flow

    Build: Проєкт збирається за допомогою pnpm та пакується в Docker контейнер.

    Artifact Registry: Образ автоматично пушиться в Google Cloud Artifact Registry з тегом SHA коміту.

    Cloud Run: Автоматичний деплой у безсерверне середовище Google Cloud.

    Workload Identity Federation: Безпечна автентифікація в Google Cloud без використання статичних JSON-ключів.

🧪 Testing Strategy

    Unit Tests: Запуск компонентних тестів перед збіркою образу.

    Smoke Test: Після деплою виконується фінальна перевірка доступності сервісу (HTTP 200 OK) за допомогою curl.