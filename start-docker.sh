#!/bin/bash

echo "🚀 Запуск ForzeStats в Docker..."

# Остановка существующих контейнеров
echo "🛑 Остановка существующих контейнеров..."
docker-compose down

# Удаление старых образов (опционально)
read -p "Удалить старые образы? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🗑️ Удаление старых образов..."
    docker-compose down --rmi all
fi

# Сборка и запуск контейнеров
echo "🔨 Сборка и запуск контейнеров..."
docker-compose up --build -d

# Проверка статуса
echo "📊 Статус контейнеров:"
docker-compose ps

echo ""
echo "✅ ForzeStats запущен!"
echo "🌐 Фронтенд: http://localhost"
echo "🔧 Бэкенд API: http://localhost:3001"
echo "📊 Redis: localhost:6379"
echo ""
echo "Для просмотра логов используйте:"
echo "  docker-compose logs -f"
echo ""
echo "Для остановки используйте:"
echo "  docker-compose down"


