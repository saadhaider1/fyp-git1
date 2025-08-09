#!/bin/bash

# Build script for Vercel deployment
echo "🚀 Starting EventSphere build process..."

# Install root dependencies
echo "📦 Installing root dependencies..."
npm install

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd backend
npm install
cd ..

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd frontend
npm install

# Build frontend
echo "🏗️  Building frontend..."
npm run build

echo "✅ Build completed successfully!"
echo "📁 Frontend build output: frontend/build/"
