#!/usr/bin/env bash
set -euo pipefail

# Build the Android release APK locally.
# ponytail: Docker build is a fallback if Flutter is not installed.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

MODE="${1:-flutter}"

case "$MODE" in
  flutter)
    if ! command -v flutter >/dev/null 2>&1; then
      echo "Flutter is not installed or not on PATH."
      echo "Install Flutter, then run: ./build_apk.sh flutter"
      echo "Or use: ./build_apk.sh docker"
      exit 1
    fi
    flutter pub get
    flutter build apk --release
    echo "APK: build/app/outputs/flutter-apk/app-release.apk"
    ;;
  docker)
    if ! command -v docker >/dev/null 2>&1; then
      echo "Docker is not installed or not on PATH."
      exit 1
    fi
    docker run --rm -it \
      -v "$ROOT_DIR:/app" \
      -w /app \
      ghcr.io/cirruslabs/flutter:stable \
      bash -lc 'flutter pub get && flutter build apk --release && echo APK: build/app/outputs/flutter-apk/app-release.apk'
    ;;
  *)
    echo "Usage: $0 [flutter|docker]"
    exit 1
    ;;
esac
