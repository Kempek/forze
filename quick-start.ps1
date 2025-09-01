Write-Host "Quick start ForzeStats..." -ForegroundColor Green

# Stop and remove old containers
Write-Host "Cleaning old containers..." -ForegroundColor Yellow
docker-compose down --volumes --remove-orphans

# Remove old images
Write-Host "Removing old images..." -ForegroundColor Yellow
docker-compose down --rmi all

# Build and start
Write-Host "Building and starting containers..." -ForegroundColor Yellow
docker-compose up --build -d

# Wait for startup
Write-Host "Waiting for services to start..." -ForegroundColor Cyan
Start-Sleep -Seconds 10

# Check status
Write-Host "Container status:" -ForegroundColor Cyan
docker-compose ps

Write-Host ""
Write-Host "ForzeStats successfully started!" -ForegroundColor Green
Write-Host ""
Write-Host "Application access:" -ForegroundColor Blue
Write-Host "   Frontend: http://localhost" -ForegroundColor White
Write-Host "   Backend API: http://localhost:3001" -ForegroundColor White
Write-Host "   Redis: localhost:6379" -ForegroundColor White
Write-Host ""
Write-Host "Useful commands:" -ForegroundColor Gray
Write-Host "   View logs: docker-compose logs -f" -ForegroundColor White
Write-Host "   Stop: docker-compose down" -ForegroundColor White
Write-Host "   Restart: docker-compose restart" -ForegroundColor White
