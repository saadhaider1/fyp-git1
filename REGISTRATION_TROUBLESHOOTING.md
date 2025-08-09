# EventSphere Registration Troubleshooting Guide

## ✅ SYSTEM STATUS: ALL WORKING ✅

Our tests confirm that:
- ✅ Backend server is running correctly (Port 5000)
- ✅ Frontend server is running correctly (Port 3000)
- ✅ Database connection is established
- ✅ Registration API is functional
- ✅ Proxy between frontend and backend is working

## 🔍 If Registration Isn't Working in Browser

### **Step 1: Check Browser Console**
1. Open http://localhost:3000 in your browser
2. Press **F12** to open Developer Tools
3. Click the **Console** tab
4. Try to register a new user
5. Look for any **red error messages** in the console

### **Step 2: Check Network Requests**
1. In Developer Tools, click the **Network** tab
2. Try to register again
3. Look for any **failed requests** (shown in red)
4. Check if `/api/auth/register` request appears and what status it returns

### **Step 3: Clear Browser Data**
1. Press **Ctrl+Shift+Delete** (Chrome) or **Ctrl+Shift+Del** (Firefox)
2. Select "All time" and check:
   - Cookies and site data
   - Cached images and files
3. Click "Clear data"
4. Try registration again

### **Step 4: Try Different Browser**
- Test with Chrome, Firefox, or Edge
- Sometimes one browser may have issues

### **Step 5: Test with Known Working Credentials**

Try registering with these details:
- **Name:** `Test User`
- **Email:** `testuser123@example.com` (or any unique email)
- **Password:** `password123`

## 🎯 Quick Manual Test

You can test the API directly:

1. **Open Command Prompt/PowerShell**
2. **Run this command:**
```powershell
$body = @{
    name = "Manual Test User"
    email = "manualtest@example.com"
    password = "testpass123"
} | ConvertTo-Json

curl -Method POST -Uri "http://localhost:3000/api/auth/register" -ContentType "application/json" -Body $body
```

If this returns "User registered successfully", then the API is working.

## 🔧 Common Issues & Solutions

### **Issue: "Network Error" or "Failed to fetch"**
**Solution:** Make sure both servers are running:
```bash
# Terminal 1: Backend
cd C:\xampp\htdocs\Eventsphere\backend
npm start

# Terminal 2: Frontend  
cd C:\xampp\htdocs\Eventsphere\frontend
npm start
```

### **Issue: "User already exists"**
**Solution:** Try a different email address

### **Issue: "Validation error"**
**Solution:** Make sure:
- Name is at least 2 characters
- Email is valid format
- Password is at least 6 characters

### **Issue: Form doesn't submit**
**Solution:** Check browser console for JavaScript errors

### **Issue: "Database connection error"**
**Solution:** Start XAMPP MySQL service

## 📊 System Check Commands

Run these to verify everything is working:

```bash
# Check if servers are running
netstat -ano | findstr :3000  # Frontend
netstat -ano | findstr :5000  # Backend

# Test API health
curl http://localhost:5000/api/health

# Test frontend proxy
curl http://localhost:3000/api/health
```

## 🆘 If Nothing Works

1. **Restart both servers:**
   - Close all terminal windows
   - Double-click `run-servers.bat` in EventSphere folder

2. **Reset database:**
   ```bash
   cd backend
   node reset-db.js
   ```

3. **Reinstall frontend dependencies:**
   ```bash
   cd frontend
   rm -rf node_modules package-lock.json
   npm install
   npm start
   ```

## ✅ Success Indicators

When registration works, you should see:
- ✅ Green success message "Registration successful!"
- ✅ Automatic redirect to home page
- ✅ User is logged in (check navbar for profile menu)

## 📞 Still Having Issues?

If registration still doesn't work after trying all steps:

1. **Check the browser console screenshot**
2. **Note the exact error message**
3. **Try the manual API test above**
4. **Check if XAMPP MySQL is running**

The system is working correctly on the backend, so any issues are likely browser-related or in the frontend JavaScript execution.
