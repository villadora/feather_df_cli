#!/bin/bash

set -e

# Function to clean build artifacts
clean_build_artifacts() {
    echo "✨ Cleaning build artifacts..."
    rm -rf build dist *.egg-info
}

# Function to build package
build_package() {
    echo "📦 Building package..."
    python3 -m pip install --upgrade build
    python3 -m build
}

# Function to upload to PyPI
upload_to_pypi() {
    echo "🚀 Uploading to PyPI..."
    python3 -m pip install --upgrade twine
    python3 -m twine upload dist/*
}

# Ensure we're in the project root directory
cd "$(dirname "$0")/"
cd ..

echo "🔨 Starting build and publish process..."

# Clean previous builds
clean_build_artifacts

# Build package
if build_package; then
    # Upload to PyPI
    if upload_to_pypi; then
        echo "✅ Package published successfully!"
        exit 0
    else
        echo "❌ Failed to upload to PyPI"
        exit 1
    fi
else
    echo "❌ Failed to build package"
    exit 1
fi