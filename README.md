# EventSphere - Event Planning Platform

EventSphere is a full-stack web application for event planning and booking, built with React frontend and Node.js backend, featuring Stripe payment integration and user authentication.

## 🚀 Features

- **User Authentication**: Sign up, login, and profile management with JWT tokens
- **Event Browsing**: Discover and search events with filters
- **Event Booking**: Book events with attendee details
- **Stripe Payment Integration**: Secure payment processing
- **Responsive Design**: Mobile-friendly interface
- **User Dashboard**: View booking history and manage profile
- **Admin Features**: Create and manage events (admin users)

## 🛠️ Tech Stack

### Frontend
- React 18
- React Router DOM
- Axios for API calls
- Stripe React components
- Lucide React icons
- React Toastify for notifications

### Backend
- Node.js with Express
- MySQL with Sequelize ORM
- JWT authentication
- Stripe payment processing
- bcrypt for password hashing
- CORS and validation middleware

## 📦 Installation & Setup

### Prerequisites
- Node.js (v16 or higher)
- MySQL database (XAMPP recommended for local development)
- Stripe account for payment processing

### 1. Clone and Setup Project

```bash
# Navigate to the EventSphere folder
cd EventSphere
```

### 2. Backend Setup

```bash
# Navigate to backend
cd backend

# Install dependencies
npm install

# Create .env file and update with your values
# .env file already created - update these values:
# - Replace JWT_SECRET with a secure random string
# - Update MySQL database credentials (default works with XAMPP)
# - Add your Stripe keys from Stripe Dashboard

# Start MySQL database (if using XAMPP)
# 1. Open XAMPP Control Panel
# 2. Start Apache and MySQL services
# 3. Database will be created automatically

# Start the backend server
npm run dev
```

The backend server will start on **http://localhost:5000**

### 3. Frontend Setup

Open a new terminal and run:

```bash
# Navigate to frontend (from EventSphere root)
cd frontend

# Install dependencies
npm install

# Create .env.local file in frontend folder
echo REACT_APP_STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key_here > .env.local

# Start the frontend development server
npm start
```

The frontend will start on **http://localhost:3000**

## 🔧 Environment Variables

### Backend (.env)
```
PORT=5000
DB_HOST=localhost
DB_NAME=eventsphere
DB_USER=root
DB_PASSWORD=
DB_PORT=3306
JWT_SECRET=your_super_secure_jwt_secret_here
STRIPE_SECRET_KEY=sk_test_your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key
NODE_ENV=development
```

### Frontend (.env.local)
```
REACT_APP_STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key
```

## 🚀 Getting Started

1. **Start both servers**:
   - Backend: `http://localhost:5000`
   - Frontend: `http://localhost:3000`

2. **Create an account**:
   - Go to `http://localhost:3000`
   - Click "Sign Up" and create a new account
   - Login with your credentials

3. **Test the application**:
   - Browse the home page
   - Navigate to Events page
   - Test user authentication
   - Check profile and bookings sections

## 📁 Project Structure

```
EventSphere/
├── backend/                 # Node.js backend
│   ├── models/             # MongoDB schemas
│   │   ├── User.js
│   │   ├── Event.js
│   │   └── Booking.js
│   ├── routes/             # API routes
│   │   ├── auth.js
│   │   ├── events.js
│   │   ├── bookings.js
│   │   └── payments.js
│   ├── middleware/         # Auth middleware
│   │   └── auth.js
│   ├── .env               # Environment variables
│   ├── package.json
│   └── server.js          # Entry point
├── frontend/               # React frontend
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── components/     # React components
│   │   │   ├── Navbar.js
│   │   │   ├── Footer.js
│   │   │   └── ProtectedRoute.js
│   │   ├── pages/         # Page components
│   │   │   ├── Home.js
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── Events.js
│   │   │   ├── EventDetail.js
│   │   │   ├── BookEvent.js
│   │   │   ├── BookingConfirmation.js
│   │   │   ├── Profile.js
│   │   │   └── MyBookings.js
│   │   ├── context/       # React context
│   │   │   └── AuthContext.js
│   │   ├── styles/        # CSS files
│   │   │   └── global.css
│   │   ├── App.js         # Main app component
│   │   └── index.js       # Entry point
│   ├── .env.local         # Frontend environment variables
│   └── package.json
└── README.md              # This file
```

## 🔐 Authentication

The app uses JWT tokens for authentication:
- Register/Login endpoints create and validate tokens
- Protected routes require authentication
- Tokens are stored in localStorage
- Auth context manages user state globally

## 💳 Payment Integration

Stripe is integrated for payment processing:
- Create payment intents for bookings
- Handle payment confirmation
- Support for refunds and cancellations
- Secure payment processing

## 🌐 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/profile` - Get user profile
- `PUT /api/auth/profile` - Update user profile

### Events
- `GET /api/events` - Get all events (with filters)
- `GET /api/events/:id` - Get event by ID
- `POST /api/events` - Create event (admin only)
- `PUT /api/events/:id` - Update event (admin only)
- `DELETE /api/events/:id` - Delete event (admin only)

### Bookings
- `POST /api/bookings` - Create booking
- `GET /api/bookings` - Get user bookings
- `GET /api/bookings/:id` - Get booking by ID
- `PUT /api/bookings/:id/cancel` - Cancel booking

### Payments
- `POST /api/payments/create-payment-intent` - Create payment intent
- `POST /api/payments/confirm-payment` - Confirm payment
- `POST /api/payments/refund` - Process refund
- `GET /api/payments/config` - Get Stripe config

## 🧪 Testing

To test the payment functionality, use Stripe's test card numbers:
- `4242 4242 4242 4242` - Visa success
- `4000 0000 0000 0002` - Card declined

## 📝 Development Notes

- The application uses MySQL database with Sequelize ORM
- JWT tokens for authentication with 30-day expiration
- Responsive design with mobile support
- Form validation on both client and server
- Error handling and user feedback with toast notifications
- Protected routes for authenticated users only
- Database tables are automatically created on first run
- Sample data is seeded automatically if database is empty

## 🚦 Production Deployment

### Vercel Deployment (Recommended)

EventSphere is now optimized for Vercel deployment! See the detailed [VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md) guide.

**Quick Steps:**
1. Push your code to GitHub
2. Connect to Vercel dashboard
3. Set up a cloud database (PlanetScale recommended)
4. Configure environment variables in Vercel
5. Deploy!

### Traditional Deployment

For traditional server deployment:

1. Set `NODE_ENV=production` in backend .env
2. Use production MySQL database
3. Use live Stripe keys
4. Build frontend: `npm run build`
5. Serve built files with backend or use separate hosting
6. Configure CORS for production domains
7. Set secure JWT secret
8. Enable HTTPS for secure connections

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 📞 Support

For support, email support@eventsphere.com or create an issue in the repository.

---

**Happy Event Planning! 🎉**
