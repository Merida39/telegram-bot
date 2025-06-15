# 🤖 Telegram Bot на Go

Telegram-бот написаний на мові Go з використанням бібліотеки [telebot.v3](https://pkg.go.dev/gopkg.in/telebot.v3). Бот автоматично відповідає на текстові повідомлення та обробляє базові команди.

##  Посилання на бота

[@discovery2405bot](https://t.me/discovery2405bot)

- Go 1.20 або вище
- Доступ до [BotFather](https://t.me/BotFather) для створення Telegram токена

###  Клонування репозиторію

```bash
git clone https://github.com/Merida39/telegram-bot.git
cd telegram-bot

## Kubernetes YAML Prompt Engineering Portfolio

This section contains Kubernetes manifests generated via AI prompt engineering as part of DevOps automation training.

| NAME | PROMPT | DESCRIPTION | EXAMPLE |
| ---- | ------ | ----------- | ------- |
| app.yaml | Generate a basic Kubernetes Deployment manifest for a Telegram Bot with 1 replica, exposing port 8080. | Simple deployment manifest. | [yaml/app.yaml](yaml/app.yaml) |
| app-livenessProbe.yaml | Generate a Kubernetes Deployment manifest for the Telegram Bot with liveness probe configured to check /health endpoint every 10 seconds. | Adds liveness probe. | [yaml/app-livenessProbe.yaml](yaml/app-livenessProbe.yaml) |
| app-readinessProbe.yaml | Generate a Kubernetes Deployment manifest for the Telegram Bot with readiness probe configured to check /ready endpoint with initial delay of 5 seconds. | Adds readiness probe. | [yaml/app-readinessProbe.yaml](yaml/app-readinessProbe.yaml) |
| app-volumeMounts.yaml | Generate a Kubernetes Deployment manifest that mounts a ConfigMap as a volume at /config in the Telegram Bot container. | Adds ConfigMap volume mount. | [yaml/app-volumeMounts.yaml](yaml/app-volumeMounts.yaml) |
| app-cronjob.yaml | Generate a Kubernetes CronJob manifest that runs a Telegram Bot batch job every day at midnight. | Kubernetes CronJob manifest. | [yaml/app-cronjob.yaml](yaml/app-cronjob.yaml) |
| app-job.yaml | Generate a Kubernetes Job manifest that runs a Telegram Bot batch job once with restart policy OnFailure. | Kubernetes Job manifest. | [yaml/app-job.yaml](yaml/app-job.yaml) |
| app-multicontainer.yaml | Generate a Kubernetes Deployment manifest for Telegram Bot with a sidecar container for logging. | Multi-container deployment. | [yaml/app-multicontainer.yaml](yaml/app-multicontainer.yaml) |
| app-resources.yaml | Generate a Kubernetes Deployment manifest with resource requests (CPU: 100m, Memory: 256Mi) and limits (CPU: 500m, Memory: 512Mi). | Adds resource requests and limits. | [yaml/app-resources.yaml](yaml/app-resources.yaml) |
| app-secret-env.yaml | Generate a Kubernetes Deployment manifest that loads environment variables from a Kubernetes Secret named "telegram-bot-secret". | Loads environment from secret. | [yaml/app-secret-env.yaml](yaml/app-secret-env.yaml) |
