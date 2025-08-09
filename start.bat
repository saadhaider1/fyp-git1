@echo off
echo ==========================================
echo    EventSphere - Quick Start Script
echo ==========================================
echo.
echo Make sure XAMPP MySQL is running first!
echo.

echo Step 1: Starting Backend Server...
echo.
start "Backend" cmd /k "cd /d %~dp0backend && npm start"

echo Step 2: Waiting 8 seconds for backend to initialize...
timeout /t 8 /nobreak > nul

echo Step 3: Starting Frontend Development Server...
echo.
start "Frontend" cmd /k "cd /d %~dp0frontend && npm start"

echo.
echo ==========================================
echo Both servers are starting!
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000 (will open automatically)
echo.
echo Login Credentials:
echo Admin: admin@eventsphere.com / admin123
echo User:  john@example.com / user123
echo ==========================================
echo.
echo Press any key to close this window...
pause > nul
