Write-Host "🚀 Запуск ForzeStats в Docker..." -ForegroundColor Green

# Остановка существующих контейнеров
Write-Host "🛑 Остановка существующих контейнеров..." -ForegroundColor Yellow
docker-compose down

# Удаление старых образов (опционально)
$removeImages = Read-Host "Удалить старые образы? (y/n)"
if ($removeImages -eq "y" -or $removeImages -eq "Y") {
    Write-Host "🗑️ Удаление старых образов..." -ForegroundColor Yellow
    docker-compose down --rmi all
}

# Сборка и запуск контейнеров
Write-Host "🔨 Сборка и запуск контейнеров..." -ForegroundColor Yellow
docker-compose up --build -d

# Проверка статуса
Write-Host "📊 Статус контейнеров:" -ForegroundColor Cyan
docker-compose ps

Write-Host ""
Write-Host "✅ ForzeStats запущен!" -ForegroundColor Green
Write-Host "🌐 Фронтенд: http://localhost" -ForegroundColor Blue
Write-Host "🔧 Бэкенд API: http://localhost:3001" -ForegroundColor Blue
Write-Host "📊 Redis: localhost:6379" -ForegroundColor Blue
Write-Host ""
Write-Host "Для просмотра логов используйте:" -ForegroundColor Gray
Write-Host "  docker-compose logs -f" -ForegroundColor White
Write-Host ""
Write-Host "Для остановки используйте:" -ForegroundColor Gray
Write-Host "  docker-compose down" -ForegroundColor White


