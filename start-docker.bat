@echo off
echo Starting FORZE Stats with Docker...
docker-compose up --build -d
echo.
echo Frontend: http://localhost:3000
echo Backend: http://localhost:3001
echo.
echo To stop: docker-compose down
pause
