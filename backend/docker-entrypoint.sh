#!/bin/sh

echo "🔄 Starting backend with database migration..."

# Wait for database to be ready
echo "⏳ Waiting for database to be ready..."
until npx prisma db push --schema=database/prisma/schema.prisma --accept-data-loss 2>/dev/null; do
  echo "Database is unavailable - sleeping"
  sleep 2
done

echo "✅ Database is ready!"

# Generate Prisma client
echo "🔧 Generating Prisma client..."
npx prisma generate --schema=database/prisma/schema.prisma

# Deploy database schema
echo "📊 Deploying database schema..."
npx prisma db push --schema=database/prisma/schema.prisma --accept-data-loss

# Optional: Seed database if seed file exists
if [ -f "database/prisma/seed.ts" ]; then
  echo "🌱 Seeding database..."
  npm run prisma:seed || echo "⚠️  Seeding failed or no seed data"
fi

echo "🚀 Starting NestJS server..."
exec npm run start:prod