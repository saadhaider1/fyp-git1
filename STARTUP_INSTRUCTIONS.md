# EventSphere - Manual Startup Instructions

## Prerequisites
1. **XAMPP is installed** and MySQL service is running
2. **Node.js** is installed (v16 or higher)
3. All dependencies are installed

## Step-by-Step Startup

### 1. Start MySQL Database
- Open XAMPP Control Panel
- Click "Start" for MySQL service
- Make sure it shows "Running" in green

### 2. Start Backend Server
```bash
# Open Command Prompt or PowerShell
cd C:\xampp\htdocs\Eventsphere\backend
npm start
```
- Wait for message: "🚀 EventSphere server running on port 5000"
- Backend will be available at: http://localhost:5000

### 3. Start Frontend Server (New Terminal)
```bash
# Open a NEW Command Prompt or PowerShell window
cd C:\xampp\htdocs\Eventsphere\frontend
npm start
```
- Wait for the React development server to start
- Browser should open automatically to: http://localhost:3000

## Login Credentials

### Admin User
- **Email:** admin@eventsphere.com
- **Password:** admin123

### Test User
- **Email:** john@example.com
- **Password:** user123

## Troubleshooting

### Frontend Won't Start
1. Try installing dependencies:
   ```bash
   cd C:\xampp\htdocs\Eventsphere\frontend
   npm install --legacy-peer-deps
   ```

2. If ESLint errors occur, try:
   ```bash
   npm start -- --disable-eslint
   ```

### Backend Database Issues
1. Reset the database:
   ```bash
   cd C:\xampp\htdocs\Eventsphere\backend
   node reset-db.js
   ```

2. Manual initialization:
   ```bash
   node init-db.js
   ```

### Port Already in Use
- Make sure no other services are running on ports 3000 or 5000
- Close any existing terminals running the servers

## Project URLs
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:5000
- **Health Check:** http://localhost:5000/api/health

## Features to Test
1. **User Registration/Login**
2. **Event Browsing**
3. **Event Booking** (requires login)
4. **Payment Processing** (use test card: 4242 4242 4242 4242)
5. **User Profile Management**
6. **Booking History**
