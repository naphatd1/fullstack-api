#!/bin/bash

# Docker Start Script
echo "🚀 Starting Docker containers..."

# Create necessary directories
mkdir -p nginx
mkdir -p backend/uploads

# Build and start all services
docker-compose up --build -d

echo "✅ Docker containers started successfully!"
echo ""
echo "📋 Services:"
echo "   - Frontend: http://localhost"
echo "   - Backend API: http://localhost/api"
echo "   - Direct Backend: http://localhost:4000"
echo "   - PostgreSQL: localhost:5432"
echo ""
echo "🔍 Check status with: docker-compose ps"
echo "📝 View logs with: docker-compose logs -f [service_name]"
echo "🛑 Stop with: docker-compose down"