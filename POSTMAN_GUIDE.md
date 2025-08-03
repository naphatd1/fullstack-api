# 📮 Postman API Testing Guide

## 🚀 Quick Setup

### 1. Import Collection และ Environment

1. **เปิด Postman**
2. **Import Collection:**
   - Click `Import` button
   - Select `postman-collection.json`
3. **Import Environment:**
   - Click `Import` button  
   - Select `postman-environment.json`
4. **Select Environment:**
   - เลือก "This House Is The Best - Environment" จาก dropdown

### 2. Test API Connection

1. **Health Check:**
   ```
   GET {{base_url}}/health
   ```
   - ควรได้ response: `{"status": "ok", ...}`

2. **Direct Backend Check:**
   ```
   GET {{direct_backend_url}}/health
   ```

## 🔐 Authentication Flow

### Step 1: Login
```http
POST {{base_url}}/auth/login
Content-Type: application/json

{
  "email": "admin@example.com",
  "password": "admin123"
}
```

**Response จะมี:**
- `access_token` - จะถูกเซ็ตใน environment variable อัตโนมัติ
- `refresh_token` - จะถูกเซ็ตใน environment variable อัตโนมัติ
- `user` object พร้อม user ID

### Step 2: Test Authenticated Endpoint
```http
GET {{base_url}}/auth/profile
Authorization: Bearer {{access_token}}
```

## 📋 API Categories

### 🔐 Authentication
- **Register:** `POST /auth/register`
- **Login:** `POST /auth/login` (auto-saves tokens)
- **Profile:** `GET /auth/profile`
- **Refresh:** `POST /auth/refresh`
- **Logout:** `POST /auth/logout`

### 👤 Users
- **Get Profile:** `GET /users/profile`
- **Update Profile:** `PATCH /users/profile`
- **Change Password:** `PATCH /users/change-password`
- **Get All Users:** `GET /users` (Admin only)
- **Get User by ID:** `GET /users/{id}` (Admin only)

### 📝 Posts
- **My Posts:** `GET /posts/my-posts`
- **All Posts:** `GET /posts`
- **Get Post:** `GET /posts/{id}`
- **Create Post:** `POST /posts`
- **Update Post:** `PATCH /posts/{id}`
- **Delete Post:** `DELETE /posts/{id}`

### 📁 File Upload
- **Single Image:** `POST /upload/images/single`
- **Multiple Images:** `POST /upload/images/multiple`
- **Document:** `POST /upload/documents/single`
- **My Images:** `GET /upload/images/my-images`
- **My Documents:** `GET /upload/documents/my-documents`
- **Delete Image:** `DELETE /upload/images/{id}`
- **Delete Document:** `DELETE /upload/documents/{id}`

### 📊 File Management
- **All Files:** `GET /files`
- **Get File:** `GET /files/{id}`
- **Update File:** `PATCH /files/{id}`
- **Serve File:** `GET /files/serve/{id}`

### 📈 Monitoring
- **System Health:** `GET /monitoring/health`
- **System Metrics:** `GET /monitoring/system`
- **Performance:** `GET /monitoring/performance`
- **Database Stats:** `GET /monitoring/database`
- **Storage Stats:** `GET /monitoring/storage`
- **API Metrics:** `GET /monitoring/api-metrics`
- **Alerts:** `GET /monitoring/alerts`

### 🏥 Health Check
- **Basic Health:** `GET /health`
- **Direct Backend:** `GET {{direct_backend_url}}/health`
- **Nginx Health:** `GET http://localhost:8080/health`

## 🛠️ Testing Scenarios

### Scenario 1: Complete User Flow
1. **Register** new user
2. **Login** with credentials
3. **Get Profile** to verify login
4. **Create Post**
5. **Upload Image**
6. **Get My Posts**
7. **Logout**

### Scenario 2: Admin Flow
1. **Login** as admin
2. **Get All Users**
3. **Get System Health**
4. **View Monitoring Data**
5. **Manage Files**

### Scenario 3: File Upload Flow
1. **Login**
2. **Upload Single Image**
3. **Upload Multiple Images**
4. **Upload Document**
5. **Get My Files**
6. **Delete File**

## 🔧 Environment Variables

| Variable | Description | Auto-Set |
|----------|-------------|----------|
| `base_url` | Main API URL (through Nginx) | ❌ |
| `direct_backend_url` | Direct backend URL | ❌ |
| `access_token` | JWT Access Token | ✅ |
| `refresh_token` | JWT Refresh Token | ✅ |
| `user_id` | Current User ID | ✅ |
| `admin_email` | Admin email for testing | ❌ |
| `admin_password` | Admin password for testing | ❌ |

## 📝 Sample Data

### User Registration
```json
{
  "email": "test@example.com",
  "password": "password123",
  "name": "Test User"
}
```

### Create Post
```json
{
  "title": "My New Post",
  "content": "This is the content of my new post.",
  "published": true
}
```

### Update Profile
```json
{
  "name": "Updated Name",
  "email": "updated@example.com"
}
```

## 🚨 Troubleshooting

### Common Issues

1. **401 Unauthorized:**
   - ตรวจสอบว่า login แล้วหรือยัง
   - ตรวจสอบ `access_token` ใน environment

2. **404 Not Found:**
   - ตรวจสอบ URL ใน environment variables
   - ตรวจสอบว่า Docker containers รันอยู่หรือไม่

3. **CORS Error:**
   - ใช้ `{{base_url}}` แทน `{{direct_backend_url}}`
   - ตรวจสอบ nginx configuration

4. **File Upload Failed:**
   - ตรวจสอบ file size (max 10MB)
   - ตรวจสอบ file type ที่รองรับ

### Debug Commands
```bash
# Check Docker containers
docker-compose ps

# Check API health
curl http://localhost:8080/api/health

# Check direct backend
curl http://localhost:4000/api/health

# View logs
docker-compose logs backend
docker-compose logs frontend
docker-compose logs nginx
```

## 🎯 Testing Tips

1. **ใช้ Tests Tab** ใน Postman เพื่อ auto-validate responses
2. **ใช้ Pre-request Scripts** เพื่อ setup data
3. **ใช้ Collection Runner** เพื่อรัน test suite
4. **Save responses** เป็น examples สำหรับ documentation
5. **ใช้ Variables** เพื่อ reuse data ระหว่าง requests

## 📚 Additional Resources

- **Swagger Documentation:** http://localhost:8080/api/docs
- **Frontend:** http://localhost:8080
- **Direct Backend:** http://localhost:4000
- **Database:** localhost:5433 (PostgreSQL)

---

Happy Testing! 🚀