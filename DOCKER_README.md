# ForzeStats Docker Setup

Этот проект настроен для работы с двумя отдельными Docker контейнерами:
- **Frontend** - React приложение (порт 80)
- **Backend** - Node.js API сервер (порт 3001)
- **Redis** - Кэширование (порт 6379)

## Структура контейнеров

### Frontend Container (`Dockerfile.frontend`)
- **Базовый образ**: `node:18-alpine` для сборки, `nginx:alpine` для production
- **Порт**: 80
- **Содержимое**: React приложение, собранное в статические файлы
- **Веб-сервер**: Nginx

### Backend Container (`Dockerfile.backend`)
- **Базовый образ**: `node:18-alpine`
- **Порт**: 3001
- **Содержимое**: Node.js сервер с API
- **Особенности**: Включает Puppeteer для веб-скрапинга

## Быстрый старт

### 1. Запуск всех сервисов
```bash
# Используя скрипт
./start-docker.sh

# Или вручную
docker-compose up --build -d
```

### 2. Проверка статуса
```bash
docker-compose ps
```

### 3. Просмотр логов
```bash
# Все сервисы
docker-compose logs -f

# Конкретный сервис
docker-compose logs -f frontend
docker-compose logs -f backend
docker-compose logs -f redis
```

### 4. Остановка
```bash
docker-compose down
```

## Доступ к приложению

- **Фронтенд**: http://localhost
- **Бэкенд API**: http://localhost:3001
- **Redis**: localhost:6379

## Отдельная сборка контейнеров

### Frontend
```bash
docker build -f Dockerfile.frontend -t forze-frontend .
docker run -p 80:80 forze-frontend
```

### Backend
```bash
docker build -f Dockerfile.backend -t forze-backend .
docker run -p 3001:3001 forze-backend
```

## Оптимизация

### Размер образов
- Используются multi-stage builds для минимизации размера
- Alpine Linux для меньшего размера базового образа
- Исключены ненужные файлы через `.dockerignore`

### Производительность
- Nginx для раздачи статических файлов фронтенда
- Redis для кэширования
- Health checks для мониторинга

## Переменные окружения

### Backend
- `NODE_ENV=production`
- `PORT=3001`
- `PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true`
- `PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser`

## Troubleshooting

### Проблемы с Puppeteer
Если возникают проблемы с Puppeteer в контейнере:
```bash
# Проверка установки Chromium
docker exec forze-stats-backend which chromium-browser

# Проверка переменных окружения
docker exec forze-stats-backend env | grep PUPPETEER
```

### Проблемы с портами
Если порты заняты:
```bash
# Проверка занятых портов
netstat -tulpn | grep :80
netstat -tulpn | grep :3001

# Изменение портов в docker-compose.yml
```

### Очистка
```bash
# Удаление всех контейнеров и образов
docker-compose down --rmi all --volumes --remove-orphans

# Очистка Docker системы
docker system prune -a
```

## Разработка

### Hot reload для разработки
```bash
# Frontend dev server
docker run -p 5173:5173 -v $(pwd):/app -w /app node:18-alpine npm run dev

# Backend dev server
docker run -p 3001:3001 -v $(pwd)/server:/app -w /app node:18-alpine npm run dev
```


