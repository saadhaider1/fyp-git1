Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    EventSphere - Quick Start Script" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Make sure XAMPP MySQL is running first!" -ForegroundColor Yellow
Write-Host ""

# Get the script directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

Write-Host "Step 1: Starting Backend Server..." -ForegroundColor Green
Write-Host ""
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\backend'; npm start" -WindowStyle Normal

Write-Host "Step 2: Waiting 8 seconds for backend to initialize..." -ForegroundColor Green
Start-Sleep -Seconds 8

Write-Host "Step 3: Starting Frontend Development Server..." -ForegroundColor Green
Write-Host ""
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\frontend'; npm start" -WindowStyle Normal

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Both servers are starting!" -ForegroundColor Green
Write-Host ""
Write-Host "Backend:  http://localhost:5000" -ForegroundColor White
Write-Host "Frontend: http://localhost:3000 (will open automatically)" -ForegroundColor White
Write-Host ""
Write-Host "Login Credentials:" -ForegroundColor Yellow
Write-Host "Admin: admin@eventsphere.com / admin123" -ForegroundColor White
Write-Host "User:  john@example.com / user123" -ForegroundColor White
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press any key to close this window..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
