# 🚀 Как пользоваться проектом ForzeStats

## 📋 Требования

- **Docker Desktop** установлен и запущен
- **PowerShell** (для Windows)
- Минимум **4GB RAM** для Docker

## 🚀 Быстрый старт

### 1. Запуск проекта
```powershell
# Самый простой способ
.\quick-start.ps1

# Или вручную
docker-compose up --build -d
```

### 2. Проверка работы
Откройте браузер и перейдите по адресам:
- **Фронтенд**: http://212.193.26.100
- **Бэкенд API**: http://212.193.26.100:3001
- **Redis**: 212.193.26.100:6379

## 📊 Управление проектом

### Просмотр статуса
```powershell
# Статус всех контейнеров
docker-compose ps

# Подробная информация
docker-compose ps -a
```

### Просмотр логов
```powershell
# Все сервисы
docker-compose logs -f

# Конкретный сервис
docker-compose logs -f frontend
docker-compose logs -f backend
docker-compose logs -f redis
```

### Остановка проекта
```powershell
# Остановка с сохранением данных
docker-compose down

# Полная очистка
docker-compose down --volumes --remove-orphans
```

### Перезапуск
```powershell
# Перезапуск всех сервисов
docker-compose restart

# Перезапуск конкретного сервиса
docker-compose restart backend
```

## 🔧 Разработка

### Режим разработки (без Docker)
```powershell
# Фронтенд
npm run dev

# Бэкенд (в отдельном терминале)
cd server
npm run dev
```

### Hot reload в Docker
```powershell
# Фронтенд с hot reload
docker run -p 5173:5173 -v ${PWD}:/app -w /app node:16-alpine npm run dev

# Бэкенд с hot reload
docker run -p 3001:3001 -v ${PWD}/server:/app -w /app node:16-alpine npm run dev
```

## 🐛 Troubleshooting

### Проблема: Контейнеры не запускаются
```powershell
# Проверка Docker
docker --version
docker-compose --version

# Очистка и перезапуск
docker-compose down --volumes --remove-orphans
docker system prune -a
.\quick-start.ps1
```

### Проблема: Порты заняты
```powershell
# Проверка занятых портов
netstat -ano | findstr :80
netstat -ano | findstr :3001

# Изменение портов в docker-compose.yml
```

### Проблема: Недостаточно памяти
```powershell
# Увеличьте лимит памяти в Docker Desktop
# Settings -> Resources -> Memory: 4GB+
```

### Проблема: Медленная сборка
```powershell
# Очистка кэша Docker
docker builder prune -a

# Использование BuildKit
$env:DOCKER_BUILDKIT=1
docker-compose up --build -d
```

## 📁 Структура проекта

```
ForzeStats/
├── src/                    # React фронтенд
│   ├── components/         # React компоненты
│   ├── App.jsx            # Главный компонент
│   └── main.jsx           # Точка входа
├── server/                # Node.js бэкенд
│   ├── server.js          # Основной сервер
│   ├── faceit-api.js      # FACEIT API
│   └── faceit-scraper.js  # Веб-скрапер
├── Dockerfile.frontend     # Docker для фронтенда
├── Dockerfile.backend      # Docker для бэкенда
├── docker-compose.yml     # Конфигурация контейнеров
└── nginx-frontend.conf    # Nginx конфигурация
```

## 🔍 API Endpoints

### Бэкенд API (порт 3001)
- `GET /api/health` - Проверка здоровья сервера
- `GET /api/players` - Список игроков
- `GET /api/matches` - Список матчей
- `GET /api/stats` - Статистика команды

### Примеры запросов
```javascript
// Получение списка игроков
fetch('http://212.193.26.100:3001/api/players')
  .then(response => response.json())
  .then(data => console.log(data));

// Получение статистики
fetch('http://212.193.26.100:3001/api/stats')
  .then(response => response.json())
  .then(data => console.log(data));
```

## 🎯 Основные функции

### Фронтенд
- 📊 Отображение статистики команды
- 👥 Список игроков с их данными
- 🏆 История матчей
- 📈 Графики и диаграммы
- 🔄 Автообновление данных

### Бэкенд
- 🔗 Интеграция с FACEIT API
- 🌐 Веб-скрапинг данных
- 💾 Кэширование в Redis
- 📊 Обработка статистики
- 🔄 Периодическое обновление

## 🔐 Безопасность

- ✅ Изолированные контейнеры
- ✅ Непривилегированные пользователи
- ✅ Ограничение ресурсов
- ✅ Health checks
- ✅ Rate limiting

## 📈 Мониторинг

### Health Checks
```powershell
# Проверка здоровья контейнеров
docker-compose ps

# Подробная информация о health checks
docker inspect forze-stats-backend | Select-String "Health"
```

### Метрики
- **CPU**: `docker stats`
- **Память**: `docker stats`
- **Сеть**: `docker stats`

## 🚀 Production развертывание

### Настройка для продакшена
1. Измените порты в `docker-compose.yml`
2. Настройте SSL сертификаты
3. Добавьте мониторинг (Prometheus/Grafana)
4. Настройте бэкапы Redis

### Команды для продакшена
```powershell
# Запуск в фоновом режиме
docker-compose up -d

# Автозапуск при перезагрузке
docker-compose up -d --restart always
```

## 📞 Поддержка

### Полезные команды
```powershell
# Вход в контейнер
docker exec -it forze-stats-backend sh
docker exec -it forze-stats-frontend sh

# Просмотр файлов в контейнере
docker exec forze-stats-backend ls -la

# Проверка переменных окружения
docker exec forze-stats-backend env
```

### Логи и отладка
```powershell
# Последние 50 строк логов
docker-compose logs --tail=50

# Логи с временными метками
docker-compose logs -t

# Логи конкретного сервиса
docker-compose logs backend | Select-String "error"
```

---

## ✅ Готово!

Теперь вы знаете, как пользоваться проектом ForzeStats! 

**Основные команды для запоминания:**
- `.\quick-start.ps1` - Быстрый запуск
- `docker-compose ps` - Статус
- `docker-compose logs -f` - Логи
- `docker-compose down` - Остановка


