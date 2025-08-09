# EventSphere - Quick Start Guide

## ✅ FIXED & READY TO USE!

The EventSphere project has been fully configured and is ready to run. All database setup, dependencies, and configurations are complete.

## 🚀 How to Start the Application

### Option 1: Automatic Start (RECOMMENDED)
1. **Start XAMPP MySQL service first**
   - Open XAMPP Control Panel
   - Click "Start" next to MySQL (should show green "Running")

2. **Run the startup script**
   - Double-click `run-servers.bat` in the Eventsphere folder
   - This will automatically start both backend and frontend servers
   - Browser will open automatically to http://localhost:3000

### Option 2: Manual Start
If you prefer to start servers manually:

1. **Backend Server:**
   ```bash
   # Open Command Prompt/PowerShell
   cd C:\xampp\htdocs\Eventsphere\backend
   npm start
   ```
   
2. **Frontend Server (New Terminal):**
   ```bash
   # Open NEW Command Prompt/PowerShell  
   cd C:\xampp\htdocs\Eventsphere\frontend
   npm start
   ```

## 🌐 Access URLs
- **Frontend (Main App):** http://localhost:3000
- **Backend API:** http://localhost:5000

## 🔐 Test Login Credentials

### Admin User (Full Access)
- **Email:** admin@eventsphere.com
- **Password:** admin123

### Regular User
- **Email:** john@example.com  
- **Password:** user123

## 🎯 What You Can Test

1. **User Registration & Login**
2. **Browse Events** (6 sample events included)
3. **Event Booking** (login required)
4. **Payment Processing** (use test card: 4242 4242 4242 4242)
5. **User Dashboard & Bookings**
6. **Admin Event Management** (admin login required)

## 🔧 If Something Goes Wrong

### Frontend Not Loading?
- Make sure both backend and frontend servers are running
- Check if XAMPP MySQL is started
- Try refreshing the browser page

### "Can't reach this page" Error?
- The frontend development server isn't running
- Run: `cd C:\xampp\htdocs\Eventsphere\frontend && npm start`

### Backend API Errors?
- Ensure MySQL is running in XAMPP
- Database tables are automatically created on first run

## 📱 Features Overview

- **Modern React 18 Frontend** with responsive design
- **Node.js/Express Backend** with MySQL database
- **Stripe Payment Integration** (test mode)
- **JWT Authentication** with protected routes
- **Event Management System** with booking capabilities
- **Admin Panel** for event management
- **User Dashboard** with booking history

## 🎉 Success!
When both servers are running:
- Backend shows: "🚀 EventSphere server running on port 5000"
- Frontend opens browser automatically to the application
- You can login and start testing all features!

---
**Everything is configured and ready to go! Just double-click `run-servers.bat` to start.**
