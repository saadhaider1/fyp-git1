@echo off
echo ========================================
echo        EventSphere Server Startup
echo ========================================
echo.

REM Check if XAMPP MySQL is running
echo Checking if MySQL is running...
netstat -ano | findstr ":3306" >nul
if %errorlevel% neq 0 (
    echo WARNING: MySQL might not be running on port 3306
    echo Please start XAMPP MySQL service first!
    echo.
    pause
    exit /b 1
)
echo MySQL is running ✓
echo.

REM Start backend server
echo Starting backend server on port 5000...
start "EventSphere Backend" cmd /c "cd /d %~dp0backend && npm start && pause"
echo Backend server starting...
echo.

REM Wait for backend to initialize
echo Waiting 8 seconds for backend to initialize...
timeout /t 8 /nobreak >nul
echo.

REM Start frontend server
echo Starting frontend server on port 3000...
start "EventSphere Frontend" cmd /c "cd /d %~dp0frontend && npm start && pause"
echo Frontend server starting...
echo.

echo ========================================
echo Both servers are now starting!
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Login Credentials:
echo Admin: admin@eventsphere.com / admin123  
echo User:  john@example.com / user123
echo ========================================
echo.
echo The servers are running in separate windows.
echo Close those windows to stop the servers.
echo.
echo Opening frontend in browser in 10 seconds...
timeout /t 10 /nobreak >nul
start http://localhost:3000

echo.
echo Press any key to close this startup window...
pause >nul
