# 🚀 Быстрый старт FORZE Stats

## ⚡ Быстрый запуск

### Вариант 1: Автоматический запуск

```bash
# Сделать скрипт исполняемым (если нужно)
chmod +x start.sh

# Запустить интерактивный скрипт
./start.sh
```

### Вариант 2: Ручной запуск

```bash
# 1. Установить зависимости
npm install
cd server && npm install && cd ..

# 2. Запустить сервер (в одном терминале)
cd server
npm run dev

# 3. Запустить клиент (в другом терминале)
npm run dev
```

### Вариант 3: Docker

```bash
# Запустить с Docker Compose
docker-compose up --build -d
```

## 🌐 Доступ к приложению

- **Клиент**: http://212.193.26.100:5173
- **Сервер API**: http://212.193.26.100:3001
- **Health Check**: http://212.193.26.100:3001/api/health

## 📊 Возможности

### Вкладки:

1. **Обзор** - общая статистика по всем платформам
2. **HLTV** - турнирные матчи и статистика
3. **FACEIT** - соревновательные матчи
4. **Игроки** - состав команды и рейтинги

### Функции:

- ✅ Интерактивные графики
- ✅ Детальные таблицы с фильтрацией
- ✅ Кэширование данных
- ✅ Автоматическое обновление
- ✅ Адаптивный дизайн
- ✅ Обработка ошибок

## 🔧 Управление

### Кнопки в интерфейсе:

- **Очистить кэш** - сброс кэшированных данных
- **Обновить** - принудительное обновление данных

### API Endpoints:

- `GET /api/forze/matches` - матчи HLTV
- `GET /api/forze/roster` - состав команды
- `GET /api/faceit/stats` - статистика FACEIT
- `GET /api/stats/overview` - общая статистика
- `POST /api/cache/clear` - очистка кэша

## 🐛 Решение проблем

### Сервер не запускается:

```bash
# Проверить порт 3001
lsof -i :3001

# Убить процесс если занят
kill -9 <PID>
```

### Ошибки Puppeteer:

```bash
# Установить зависимости для Puppeteer
# Ubuntu/Debian:
sudo apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# macOS:
brew install chromium
```

### Проблемы с зависимостями:

```bash
# Очистить кэш npm
npm cache clean --force

# Удалить node_modules и переустановить
rm -rf node_modules server/node_modules
npm install
cd server && npm install && cd ..
```

## 📱 Мобильная версия

Приложение полностью адаптивно и работает на:

- 📱 Смартфоны
- 📱 Планшеты
- 💻 Десктопы

## 🔄 Обновление данных

Данные обновляются автоматически:

- **FACEIT**: каждые 5 минут
- **HLTV**: каждые 10 минут
- **Кэш**: автоматически очищается при истечении срока

## 🎯 Готово!

Приложение готово к использованию! Откройте http://212.193.26.100:5173 в браузере.

---

**FORZE Stats** - современная платформа для отслеживания статистики команды FORZE Reload! 🎮

