#!/bin/bash

echo "🔄 Running database migration..."

# Run Prisma migration inside backend container
docker exec nestjs_backend npx prisma generate --schema=database/prisma/schema.prisma
docker exec nestjs_backend npx prisma db push --schema=database/prisma/schema.prisma --accept-data-loss

echo "✅ Database migration completed!"

# Optional: Run seed if exists
echo "🌱 Seeding database..."
docker exec nestjs_backend npm run prisma:seed || echo "⚠️  No seed data or seeding failed"

echo "🎉 Database setup complete!"