#!/bin/bash

# Docker Logs Script
echo "📝 Docker container logs..."
echo ""

if [ -z "$1" ]; then
    echo "Available services:"
    echo "  - postgres"
    echo "  - backend"
    echo "  - frontend" 
    echo "  - nginx"
    echo ""
    echo "Usage: ./docker-logs.sh [service_name]"
    echo "Example: ./docker-logs.sh backend"
    echo ""
    echo "Showing all logs:"
    docker-compose logs -f
else
    echo "Showing logs for: $1"
    docker-compose logs -f $1
fi