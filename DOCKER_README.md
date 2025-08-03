# Docker Setup Guide

## 🚀 Quick Start

### Prerequisites
- Docker และ Docker Compose ติดตั้งแล้ว
- Port 80, 3000, 4000, 5432 ว่าง

### การรัน

1. **เริ่มต้น containers:**
   ```bash
   chmod +x docker-start.sh
   ./docker-start.sh
   ```

2. **เข้าใช้งาน:**
   - Frontend: http://localhost
   - Backend API: http://localhost/api
   - Direct Backend: http://localhost:4000

3. **หยุด containers:**
   ```bash
   chmod +x docker-stop.sh
   ./docker-stop.sh
   ```

## 📋 Services

### 🗄️ PostgreSQL Database
- **Container:** `postgres_db`
- **Port:** 5432
- **Database:** nestdb
- **User:** naphat
- **Password:** 123456

### 🔧 Backend (NestJS)
- **Container:** `nestjs_backend`
- **Port:** 4000
- **Framework:** NestJS + Prisma
- **Database:** PostgreSQL

### 🎨 Frontend (Next.js)
- **Container:** `nextjs_frontend`
- **Port:** 3000
- **Framework:** Next.js 15
- **Mode:** Production (standalone)

### 🌐 Nginx Reverse Proxy
- **Container:** `nginx_proxy`
- **Port:** 80
- **Features:**
  - Rate limiting
  - CORS headers
  - Security headers
  - Static file caching

## 🛠️ Commands

### การจัดการ Containers
```bash
# ดู status
docker-compose ps

# ดู logs ทั้งหมด
./docker-logs.sh

# ดู logs ของ service เฉพาะ
./docker-logs.sh backend
./docker-logs.sh frontend
./docker-logs.sh postgres
./docker-logs.sh nginx

# Restart service เฉพาะ
docker-compose restart backend

# Rebuild และ restart
docker-compose up --build -d backend
```

### การจัดการ Database
```bash
# เข้า PostgreSQL
docker exec -it postgres_db psql -U naphat -d nestdb

# Backup database
docker exec postgres_db pg_dump -U naphat nestdb > backup.sql

# Restore database
docker exec -i postgres_db psql -U naphat -d nestdb < backup.sql
```

### การ Debug
```bash
# เข้า container
docker exec -it nestjs_backend sh
docker exec -it nextjs_frontend sh

# ดู network
docker network ls
docker network inspect nestjs-app_app-network
```

## 🔧 Configuration

### Environment Variables
แก้ไขใน `.env` file:
```env
# Database
POSTGRES_DB=nestdb
POSTGRES_USER=naphat
POSTGRES_PASSWORD=123456

# JWT Secrets (เปลี่ยนใน production!)
JWT_SECRET=your-super-secret-jwt-key
JWT_REFRESH_TOKEN_SECRET=your-super-secret-refresh-key

# URLs
NEXT_PUBLIC_API_URL=http://localhost/api
NEXT_PUBLIC_SITE_URL=http://localhost
```

### Nginx Configuration
แก้ไขใน `nginx/default.conf` สำหรับ:
- Rate limiting
- CORS policies
- SSL/HTTPS
- Custom domains

## 🔒 Security

### Production Checklist
- [ ] เปลี่ยน JWT secrets
- [ ] เปลี่ยน database password
- [ ] ตั้งค่า CORS origins ที่เหมาะสม
- [ ] เปิดใช้ HTTPS
- [ ] ตั้งค่า firewall
- [ ] อัพเดต security headers

### Rate Limiting
- API endpoints: 10 requests/second
- Auth endpoints: 5 requests/minute
- Burst limit: 20 requests

## 🚨 Troubleshooting

### Common Issues

1. **Port already in use:**
   ```bash
   # หา process ที่ใช้ port
   lsof -i :80
   lsof -i :4000
   
   # หยุด process
   sudo kill -9 <PID>
   ```

2. **Database connection failed:**
   ```bash
   # ตรวจสอบ database health
   docker-compose logs postgres
   
   # Restart database
   docker-compose restart postgres
   ```

3. **Frontend build failed:**
   ```bash
   # ดู build logs
   docker-compose logs frontend
   
   # Rebuild
   docker-compose up --build -d frontend
   ```

4. **Nginx 502 Bad Gateway:**
   ```bash
   # ตรวจสอบ upstream services
   docker-compose ps
   
   # ดู nginx logs
   docker-compose logs nginx
   ```

### Health Checks
- Database: `docker exec postgres_db pg_isready -U naphat -d nestdb`
- Backend: `curl http://localhost:4000/api/health`
- Frontend: `curl http://localhost:3000`
- Nginx: `curl http://localhost/health`

## 📁 File Structure
```
├── docker-compose.yml          # Main compose file
├── .env                       # Environment variables
├── nginx/
│   ├── nginx.conf            # Nginx main config
│   └── default.conf          # Server config
├── backend/
│   ├── Dockerfile            # Backend image
│   └── .dockerignore         # Backend ignore
├── frontend/
│   ├── Dockerfile            # Frontend image
│   └── .dockerignore         # Frontend ignore
└── scripts/
    ├── docker-start.sh       # Start script
    ├── docker-stop.sh        # Stop script
    └── docker-logs.sh        # Logs script
```