# 🚀 Full-Stack Authentication & File Management System

A comprehensive full-stack application built with **NestJS** (backend) and **Next.js** (frontend), featuring robust authentication, file management, monitoring, and user administration capabilities.

## 🎯 Overview

This project is a complete enterprise-ready solution that combines:
- **Backend API**: NestJS-based RESTful API with PostgreSQL
- **Frontend**: Next.js application with modern React features
- **Authentication**: JWT-based authentication with role-based access control
- **File Management**: Hybrid storage system with Supabase and local storage
- **Monitoring**: Real-time system and API monitoring
- **Containerization**: Full Docker support with production-ready configuration

## ✨ Key Features

### 🔐 Authentication & Authorization
- JWT-based authentication system
- Role-based access control (Admin, User roles)
- Secure password hashing with Argon2
- Refresh token mechanism
- Protected routes and API endpoints

### 📁 File Management System
- **Image Upload**: Single and multiple image upload with thumbnail generation
- **Document Upload**: Support for various document formats
- **Chunk Upload**: Large file upload with chunking support
- **Hybrid Storage**: Supabase Storage + Local file system
- **File Processing**: Image optimization and processing with Sharp

### 📊 Monitoring & Analytics
- Real-time system metrics (CPU, Memory, Disk usage)
- Database performance monitoring
- API response time tracking
- File storage analytics
- User activity monitoring
- Health check endpoints

### 👥 User Management
- User CRUD operations
- Profile management with image uploads
- Admin dashboard
- User role management
- Activity tracking

### 🔒 Security Features
- Rate limiting and throttling
- Input validation and sanitization
- CORS protection
- Security headers with Helmet
- File upload security measures
- XSS and CSRF protection

## 🛠️ Tech Stack

### Backend
- **Framework**: NestJS (Node.js)
- **Database**: PostgreSQL
- **ORM**: Prisma
- **Authentication**: JWT + Passport
- **File Storage**: Supabase Storage
- **Image Processing**: Sharp
- **Validation**: Class Validator & Class Transformer
- **Testing**: Jest
- **Documentation**: Swagger/OpenAPI

### Frontend
- **Framework**: Next.js 15
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **State Management**: Redux Toolkit
- **Form Handling**: React Hook Form
- **UI Components**: Custom component library
- **HTTP Client**: Custom API client with error handling

### DevOps & Infrastructure
- **Containerization**: Docker & Docker Compose
- **Reverse Proxy**: Nginx
- **Process Management**: PM2
- **Testing**: Newman (Postman), Jest
- **Monitoring**: Custom metrics system

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ and npm
- PostgreSQL 15+
- Docker & Docker Compose (optional)

### 1. Clone the Repository
```bash
git clone <repository-url>
cd fullstacks-main
```

### 2. Environment Setup
```bash
# Backend environment
cd backend
cp .env.example .env
# Edit .env with your configuration

# Frontend environment  
cd ../frontend
cp .env.example .env
# Edit .env with your configuration
```

### 3. Database Setup
```bash
cd backend
npm install
npx prisma generate
npx prisma migrate deploy
npx prisma db seed
```

### 4. Start Development Servers
```bash
# Terminal 1 - Backend
cd backend
npm run start:dev

# Terminal 2 - Frontend  
cd frontend
npm run dev
```

### 5. Docker Alternative (Recommended)
```bash
# Start all services with Docker
docker-compose up -d

# View logs
docker-compose logs -f
```

## 🌐 Application URLs

| Service | URL | Description |
|---------|-----|-------------|
| Frontend | http://localhost:3000 | Next.js application |
| Backend API | http://localhost:4000 | NestJS API server |
| Nginx Proxy | http://localhost:8080 | Production-like setup |
| Database | localhost:5433 | PostgreSQL database |
| API Documentation | http://localhost:4000/api/docs | Swagger documentation |

## 📋 API Endpoints

### Authentication
```
POST /api/auth/register     # User registration
POST /api/auth/login        # User login
POST /api/auth/refresh      # Refresh JWT token
GET  /api/auth/profile      # Get user profile
```

### File Upload
```
POST /api/upload/images/single      # Single image upload
POST /api/upload/images/multiple    # Multiple images upload
POST /api/upload/documents/single   # Document upload
POST /api/upload/chunks/init        # Initialize chunk upload
POST /api/upload/chunks/upload      # Upload file chunk
POST /api/upload/chunks/complete    # Complete chunk upload
```

### User Management
```
GET    /api/users           # List all users (Admin)
GET    /api/users/:id       # Get user by ID
PUT    /api/users/:id       # Update user
DELETE /api/users/:id       # Delete user (Admin)
POST   /api/users/:id/avatar # Upload user avatar
```

### File Management
```
GET    /api/files/my-files  # Get user's files
GET    /api/files/:id       # Get file by ID
DELETE /api/files/:id       # Delete file
GET    /api/files/serve/:filename # Serve file
```

### Monitoring
```
GET /api/monitoring/dashboard    # Monitoring dashboard
GET /api/monitoring/system       # System metrics
GET /api/monitoring/database     # Database metrics
GET /api/monitoring/performance  # API performance
GET /health                      # Health check
GET /health/detailed            # Detailed health check
```

## 🧪 Testing

### Backend Testing
```bash
cd backend

# Unit tests
npm test

# API testing
npm run test:api

# Specific test suites
npm run test:api:auth
npm run test:api:upload
npm run test:api:monitoring
npm run test:api:health

# Full test suite
npm run test:full
```

### Frontend Testing
```bash
cd frontend

# Run tests
npm test

# Lint check
npm run lint
```

## 📦 Docker Commands

```bash
# Development environment
docker-compose up -d

# Production build
docker-compose -f docker-compose.prod.yml up -d

# View logs
docker-compose logs -f [service-name]

# Rebuild services
docker-compose up -d --build

# Stop all services
docker-compose down

# Reset everything
docker-compose down -v
docker system prune -f
```

## 📊 Monitoring & Health Checks

### Health Check Endpoints
- **Basic**: `GET /health`
- **Detailed**: `GET /health/detailed`
- **Database**: `GET /health/database`
- **Storage**: `GET /health/storage`

### Monitoring Dashboard
Access the monitoring dashboard at: `http://localhost:4000/api/monitoring/dashboard`

Features:
- Real-time system metrics
- API performance tracking
- Database query performance
- File storage usage
- User activity analytics

## 🔧 Development

### Backend Development
```bash
cd backend

# Start with hot reload
npm run start:dev

# Generate Prisma client
npm run prisma:generate

# Run database migrations
npm run prisma:migrate

# Open Prisma Studio
npm run prisma:studio

# Seed database
npm run prisma:seed
```

### Frontend Development
```bash
cd frontend

# Start development server
npm run dev

# Build for production
npm run build

# Start production server
npm start

# Check backend connectivity
npm run check-backend
```

## 📁 Project Structure

```
fullstacks-main/
├── backend/                 # NestJS API server
│   ├── src/                # Source code
│   ├── database/           # Database schema & migrations
│   ├── docs/              # Backend documentation
│   ├── deployment/        # Deployment scripts
│   └── tools/             # Development tools
├── frontend/              # Next.js application
│   ├── src/               # Source code
│   ├── public/            # Static assets
│   └── scripts/           # Frontend scripts
├── nginx/                 # Nginx configuration
├── docker-compose.yml     # Docker compose configuration
└── README.md             # This file
```

## 🔐 Security

### Authentication Flow
1. User registers/logs in
2. Server issues JWT access token (15min) + refresh token (7 days)
3. Client stores tokens securely
4. Access token used for API requests
5. Refresh token used to get new access tokens

### Security Measures
- Password hashing with Argon2
- JWT token validation
- Rate limiting (100 requests/15min per IP)
- Input validation and sanitization
- File upload restrictions
- CORS configuration
- Security headers (Helmet)
- Environment variable protection

## 🚀 Deployment

### Production Deployment
```bash
# Build and deploy with Docker
docker-compose -f docker-compose.prod.yml up -d

# Manual deployment
cd backend && npm run build
cd frontend && npm run build

# Start with PM2
pm2 start ecosystem.config.js
```

### Environment Variables

#### Backend (.env)
```env
NODE_ENV=production
PORT=4000
DATABASE_URL="postgresql://user:password@localhost:5432/database"
JWT_SECRET="your-super-secret-jwt-key"
JWT_REFRESH_TOKEN_SECRET="your-refresh-token-secret"
SUPABASE_URL="your-supabase-url"
SUPABASE_SERVICE_ROLE_KEY="your-service-role-key"
CORS_ORIGINS="http://localhost:3000,http://localhost:8080"
```

#### Frontend (.env)
```env
NEXT_PUBLIC_API_URL="http://localhost:4000/api"
NEXT_PUBLIC_SITE_URL="http://localhost:3000"
```

## 📖 Documentation

### Backend Documentation
- [Installation Guide](backend/docs/01-installation-guide.md)
- [Authentication Guide](backend/docs/02-authentication-guide.md)
- [File Upload Guide](backend/docs/03-file-upload-guide.md)
- [Monitoring Guide](backend/docs/04-monitoring-guide.md)
- [Deployment Guide](backend/docs/05-deployment-guide.md)
- [API Testing Guide](backend/docs/06-api-testing-guide.md)
- [Troubleshooting Guide](backend/docs/10-troubleshooting-guide.md)

### API Documentation
- Swagger UI: `http://localhost:4000/api/docs`
- Postman Collection: `postman-collection.json`

## 🐛 Troubleshooting

### Common Issues

1. **Database Connection Issues**
   ```bash
   # Check database status
   docker-compose ps postgres
   
   # Reset database
   docker-compose down -v
   docker-compose up -d postgres
   ```

2. **Port Conflicts**
   ```bash
   # Check port usage
   lsof -i :3000
   lsof -i :4000
   
   # Kill process
   kill -9 <PID>
   ```

3. **Environment Variables**
   ```bash
   # Verify environment
   cd backend && npm run start:dev
   cd frontend && npm run check-backend
   ```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🆘 Support

- 📖 Check the [documentation](backend/docs/)
- 🐛 Report issues via GitHub Issues
- 💬 Start a discussion for questions
- 🔍 Use health checks: `curl http://localhost:4000/health`

## 🙏 Acknowledgments

- NestJS team for the amazing framework
- Next.js team for the powerful React framework
- Prisma team for the excellent ORM
- Supabase for storage and authentication services

---

**Built with ❤️ using NestJS & Next.js**

> 💡 **Tip**: Start with the [Installation Guide](backend/docs/01-installation-guide.md) and then follow the [Authentication Guide](backend/docs/02-authentication-guide.md) for the best onboarding experience.