#!/bin/bash
set -e

echo "Building KikoFlu for Linux..."

flutter clean
flutter pub get
flutter build linux --release

BUILD_DIR="build/linux/x64/release/bundle"
echo "Build output: $BUILD_DIR"

# Create tar.gz package
VERSION=$(grep 'version:' pubspec.yaml | head -1 | awk '{print $2}')
tar -czf "KikoFlu-${VERSION}-linux-x64.tar.gz" -C "$BUILD_DIR" .
echo "Package created: KikoFlu-${VERSION}-linux-x64.tar.gz"
