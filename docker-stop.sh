#!/bin/bash

# Docker Stop Script
echo "🛑 Stopping Docker containers..."

docker-compose down

echo "✅ Docker containers stopped successfully!"
echo ""
echo "💡 To remove volumes (database data), use: docker-compose down -v"
echo "🗑️  To remove images, use: docker-compose down --rmi all"