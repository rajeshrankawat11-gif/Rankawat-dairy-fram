#!/bin/sh
set -eu
GRADLE_VERSION=8.9
CACHE="$HOME/.gradle/rankawat-gradle"
DIST="$CACHE/gradle-$GRADLE_VERSION"
ZIP="$CACHE/gradle-$GRADLE_VERSION-bin.zip"
if [ ! -x "$DIST/bin/gradle" ]; then
  mkdir -p "$CACHE"
  if [ ! -f "$ZIP" ]; then
    echo "Downloading Gradle $GRADLE_VERSION..."
    curl -fL --retry 3 -o "$ZIP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  fi
  rm -rf "$DIST.tmp"
  mkdir -p "$DIST.tmp"
  unzip -q "$ZIP" -d "$DIST.tmp"
  mv "$DIST.tmp/gradle-$GRADLE_VERSION" "$DIST"
  rmdir "$DIST.tmp" 2>/dev/null || true
fi
exec "$DIST/bin/gradle" "$@"
