# 🚀 EventSphere Vercel Deployment Guide

This guide will help you deploy EventSphere to Vercel while maintaining the React frontend and Node.js backend architecture.

## 📋 Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **GitHub Repository**: Push your EventSphere code to GitHub
3. **Cloud Database**: Set up a cloud MySQL database (recommended: PlanetScale, AWS RDS, or Railway)
4. **Stripe Account**: Get your production Stripe keys

## 🗄️ Database Setup

### Option 1: PlanetScale (Recommended - Free tier available)
1. Sign up at [planetscale.com](https://planetscale.com)
2. Create a new database
3. Get connection details from the dashboard
4. Use the connection string format: `mysql://username:password@host:port/database`

### Option 2: Railway
1. Sign up at [railway.app](https://railway.app)
2. Create a MySQL database
3. Get connection details from the dashboard

### Option 3: AWS RDS
1. Create an RDS MySQL instance
2. Configure security groups to allow connections
3. Get the endpoint and credentials

## 🔧 Environment Variables Setup

You'll need to set these environment variables in Vercel:

### Backend Variables
```bash
NODE_ENV=production
PORT=5000

# Database (Update with your cloud database details)
DB_HOST=your-production-db-host.com
DB_NAME=your_production_db_name
DB_USER=your_production_db_user
DB_PASSWORD=your_production_db_password
DB_PORT=3306

# JWT Secret (Generate a secure random string)
JWT_SECRET=your_super_secure_jwt_secret_change_this

# Stripe Keys (Use production keys for live deployment)
STRIPE_SECRET_KEY=sk_live_your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=pk_live_your_stripe_publishable_key
```

### Frontend Variables
```bash
REACT_APP_STRIPE_PUBLISHABLE_KEY=pk_live_your_stripe_publishable_key
REACT_APP_API_URL=https://your-app-name.vercel.app/api
```

## 🚀 Deployment Steps

### 1. Prepare Repository
```bash
# Make sure all changes are committed
git add .
git commit -m "Prepare for Vercel deployment"
git push origin main
```

### 2. Connect to Vercel
1. Go to [vercel.com/dashboard](https://vercel.com/dashboard)
2. Click "New Project"
3. Import your EventSphere repository from GitHub
4. Vercel will automatically detect it as a monorepo

### 3. Configure Project Settings
1. **Framework Preset**: Other
2. **Root Directory**: Leave blank (uses root)
3. **Build Command**: `npm run build`
4. **Output Directory**: `frontend/build`
5. **Install Command**: `npm run install:all`

### 4. Add Environment Variables
1. Go to Project Settings → Environment Variables
2. Add all the environment variables listed above
3. Make sure to use your actual database credentials and Stripe keys

### 5. Deploy
1. Click "Deploy"
2. Wait for the build to complete
3. Your app will be available at `https://your-app-name.vercel.app`

## 🔄 Database Migration

After deployment, you'll need to initialize your database:

### Option 1: Manual Database Setup
1. Connect to your cloud database
2. Run the SQL commands to create the necessary tables
3. Optionally seed with initial data

### Option 2: Using Database Migration Tools
The app will automatically create tables on first run, but you may want to run migrations manually for production.

## 🧪 Testing the Deployment

1. **Health Check**: Visit `https://your-app-name.vercel.app/api/health`
2. **Frontend**: Visit `https://your-app-name.vercel.app`
3. **User Registration**: Test creating a new account
4. **Payment Flow**: Test with Stripe test cards (if using test keys)

## 🔒 Security Considerations

### 1. Environment Variables
- Use strong, unique JWT secrets
- Use production Stripe keys for live deployment
- Keep database credentials secure

### 2. Database Security
- Use SSL connections in production
- Set up proper firewall rules
- Regularly backup your database

### 3. CORS Configuration
The backend is configured to accept requests from any origin in development. For production, consider restricting CORS to your domain.

## 📊 Monitoring and Maintenance

### 1. Vercel Analytics
- Enable Vercel Analytics in your dashboard
- Monitor performance and usage

### 2. Database Monitoring
- Monitor database performance
- Set up alerts for connection issues
- Regular backups

### 3. Error Tracking
- Consider integrating error tracking (Sentry, LogRocket)
- Monitor server logs in Vercel dashboard

## 🚨 Troubleshooting

### Build Errors
- Check the build logs in Vercel dashboard
- Ensure all environment variables are set correctly
- Verify that all dependencies are installed

### Database Connection Issues
- Verify database credentials
- Check if database server is running
- Ensure database accepts connections from Vercel's IP ranges

### API Errors
- Check Function logs in Vercel dashboard
- Verify environment variables are set
- Test API endpoints individually

### Payment Issues
- Verify Stripe keys are correct
- Check Stripe dashboard for webhook endpoints
- Test with Stripe test cards first

## 🔄 Updates and Redeployment

To update your deployment:
1. Make changes to your code
2. Commit and push to GitHub
3. Vercel will automatically redeploy

For manual redeployment:
1. Go to Vercel dashboard
2. Click "Redeploy" on your project

## 📞 Support

If you encounter issues:
1. Check Vercel's deployment logs
2. Verify all environment variables
3. Test locally first
4. Check database connectivity
5. Review Stripe configuration

## 🎉 Success!

Once deployed successfully, your EventSphere application will be:
- ✅ Accessible globally via Vercel's CDN
- ✅ Automatically scaled based on traffic
- ✅ Using serverless functions for the backend
- ✅ Connected to your cloud database
- ✅ Processing payments through Stripe

Your users can now access your event planning platform at your Vercel URL!
