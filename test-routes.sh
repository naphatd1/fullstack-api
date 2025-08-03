#!/bin/bash

echo "🧪 Testing Docker Routes..."
echo ""

BASE_URL="http://localhost:8080"

# Test Frontend
echo "1. Testing Frontend:"
curl -s -o /dev/null -w "   Frontend: %{http_code} - %{time_total}s\n" $BASE_URL

# Test Health Check
echo "2. Testing Health Check:"
curl -s -o /dev/null -w "   Health: %{http_code} - %{time_total}s\n" $BASE_URL/health

# Test API Routes
echo "3. Testing API Routes:"
curl -s -o /dev/null -w "   Auth: %{http_code} - %{time_total}s\n" $BASE_URL/api/auth/profile
curl -s -o /dev/null -w "   Posts: %{http_code} - %{time_total}s\n" $BASE_URL/api/posts
curl -s -o /dev/null -w "   Users: %{http_code} - %{time_total}s\n" $BASE_URL/api/users/profile

# Test Direct Backend
echo "4. Testing Direct Backend:"
curl -s -o /dev/null -w "   Backend Health: %{http_code} - %{time_total}s\n" http://localhost:4000/health
curl -s -o /dev/null -w "   Backend API: %{http_code} - %{time_total}s\n" http://localhost:4000/api/auth/profile

echo ""
echo "✅ Route testing completed!"
echo ""
echo "📋 Expected Results:"
echo "   Frontend: 200 (Next.js app)"
echo "   Health: 200 (Health check)"
echo "   Auth: 401 (Unauthorized - normal)"
echo "   Posts: 401 (Unauthorized - normal)"
echo "   Users: 401 (Unauthorized - normal)"
echo "   Backend Health: 200 (Direct backend)"
echo "   Backend API: 401 (Direct backend API)"