#!/bin/bash

echo "🔍 Checking service status..."

for service in cron ssh; do
    if systemctl is-active --quiet $service; then
        echo "✅ $service is running."
    else
        echo "❌ $service is NOT running."
    fi
done

