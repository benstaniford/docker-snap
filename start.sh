#!/bin/bash

# Image Gallery - Build and Run Script

echo "🖼️  Image Gallery Docker Setup"
echo "================================"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if sample-images directory exists
if [ ! -d "sample-images" ]; then
    echo "📁 Creating sample-images directory..."
    mkdir -p sample-images
    echo "✅ Created sample-images directory. Add your image files here."
fi

# Build and run with Docker Compose
echo "🔨 Building and starting the image gallery..."
docker-compose up --build -d

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Image Gallery is now running!"
    echo "📱 Access your gallery at: http://localhost:5000"
    echo ""
    echo "📁 Add images to the 'sample-images' directory to see them in the gallery"
    echo "🔄 Images will be automatically detected every 30 seconds"
    echo ""
    echo "🛑 To stop the gallery, run: docker-compose down"
    echo "📊 To view logs, run: docker-compose logs -f"
else
    echo "❌ Failed to start the image gallery. Check the logs for errors."
    docker-compose logs
fi
