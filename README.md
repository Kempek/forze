# FORZE Stats - Статистика команды FORZE Reload

Современное веб-приложение для отображения статистики команды FORZE Reload в CS2, объединяющее данные из HLTV и FACEIT.

## 🚀 Возможности

- **Общая статистика** - сводка по всем платформам
- **HLTV статистика** - официальные турнирные матчи
- **FACEIT статистика** - соревновательные матчи на FACEIT
- **Интерактивные графики** - визуализация результатов
- **Детальные таблицы** - с фильтрацией и сортировкой
- **Реальное время** - автоматическое обновление данных
- **Кэширование** - оптимизация производительности

## 🛠 Технологии

### Frontend

- **React 19** - современный UI фреймворк
- **Material-UI** - компонентная библиотека
- **Vite** - быстрый сборщик
- **Chart.js** - интерактивные графики
- **Recharts** - дополнительные графики

### Backend

- **Node.js** - серверная платформа
- **Express** - веб-фреймворк
- **Puppeteer** - парсинг HLTV
- **Cheerio** - парсинг HTML
- **CORS** - междоменные запросы

## 📦 Установка и запуск

### Предварительные требования

- Node.js 18+
- npm или yarn

### 1. Клонирование репозитория

```bash
git clone <repository-url>
cd ForzeStats
```

### 2. Установка зависимостей

```bash
# Установка зависимостей фронтенда
npm install

# Установка зависимостей сервера
cd server
npm install
cd ..
```

### 3. Запуск сервера

```bash
cd server
npm run dev
```

### 4. Запуск клиента

```bash
# В новом терминале
npm run dev
```

### 5. Открытие приложения

Откройте [http://localhost:5173](http://localhost:5173) в браузере.

## 📊 API Endpoints

### HLTV Endpoints

- `GET /api/forze/matches` - матчи команды
- `GET /api/forze/roster` - состав команды
- `GET /api/forze/upcoming` - предстоящие матчи

### FACEIT Endpoints

- `GET /api/faceit/stats` - статистика команды
- `GET /api/faceit/matches` - все матчи FACEIT
- `GET /api/faceit/combined` - комбинированные данные

### Общие Endpoints

- `GET /api/stats/overview` - общая статистика
- `GET /api/health` - статус сервера
- `POST /api/cache/clear` - очистка кэша

## 🎯 Структура проекта

```
ForzeStats/
├── src/                    # React приложение
│   ├── components/         # React компоненты
│   │   ├── OverviewStats.jsx
│   │   ├── FaceitStats.jsx
│   │   ├── MaterialChart.jsx
│   │   ├── MatchTable.jsx
│   │   └── GooeyNav.jsx
│   ├── App.jsx            # Главный компонент
│   └── main.jsx           # Точка входа
├── server/                # Node.js сервер
│   ├── server.js          # Основной сервер
│   ├── faceit-api.js      # FACEIT API клиент
│   └── faceit-scraper.js  # Парсер FACEIT
├── public/                # Статические файлы
└── package.json           # Зависимости
```

## 🔧 Конфигурация

### Переменные окружения (server/.env)

```env
PORT=3001
NODE_ENV=development
FACEIT_API_URL=https://www.faceit.com/api
FACEIT_TEAM_ID=8689f8ac-c01b-40f4-96c6-9e7627665b65
HLTV_TEAM_ID=12857
HLTV_TEAM_SLUG=forze-reload
```

## 📈 Особенности

### Кэширование

- FACEIT данные: 5 минут
- HLTV данные: 10 минут
- Автоматическая очистка устаревших данных

### Обработка ошибок

- Graceful fallback при недоступности API
- Тестовые данные для демонстрации
- Подробное логирование ошибок

### Производительность

- Оптимизированные запросы
- Ленивая загрузка компонентов
- Эффективное кэширование

## 🎨 UI/UX

### Дизайн

- Современный Material Design
- Адаптивная верстка
- Интерактивные элементы
- Плавные анимации

### Навигация

- Gooey навигация между вкладками
- Интуитивный интерфейс
- Быстрые фильтры

## 🔍 Использование

### Основные функции

1. **Обзор** - общая статистика по всем платформам
2. **HLTV** - детальная статистика турнирных матчей
3. **FACEIT** - статистика соревновательных матчей

### Фильтрация и поиск

- Поиск по турнирам
- Фильтрация по результатам
- Фильтрация по картам
- Фильтрация по источникам данных

### Графики

- Интерактивные диаграммы
- Статистика побед/поражений
- Тренды команды

## 🚀 Развертывание

### Docker (опционально)

```bash
# Сборка образа
docker build -t forze-stats .

# Запуск контейнера
docker run -p 3001:3001 forze-stats
```

### Production

```bash
# Сборка фронтенда
npm run build

# Запуск сервера
cd server
npm start
```

## 🤝 Вклад в проект

1. Fork репозитория
2. Создайте feature branch (`git checkout -b feature/amazing-feature`)
3. Commit изменения (`git commit -m 'Add amazing feature'`)
4. Push в branch (`git push origin feature/amazing-feature`)
5. Откройте Pull Request

## 📝 Лицензия

Этот проект лицензирован под MIT License.

## 🙏 Благодарности

- Команда FORZE Reload
- HLTV за предоставление данных
- FACEIT за API
- Сообщество React и Node.js

## 📞 Поддержка

Если у вас есть вопросы или предложения, создайте Issue в репозитории.

---

**FORZE Stats** - современная платформа для отслеживания статистики команды FORZE Reload в CS2! 🎮
