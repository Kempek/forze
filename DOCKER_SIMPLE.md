# FORZE Stats - Простой Docker запуск

## Быстрый запуск

```bash
# Сборка и запуск
docker-compose up --build -d

# Просмотр логов
docker-compose logs -f

# Остановка
docker-compose down
```

## Доступ

- **Приложение**: http://localhost:3001
- **API**: http://localhost:3001/api/health

## Управление

```bash
# Перезапуск
docker-compose restart

# Пересборка
docker-compose build

# Очистка
docker-compose down --rmi all
```




