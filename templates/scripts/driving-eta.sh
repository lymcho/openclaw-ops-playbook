#!/bin/bash
# Driving ETA Calculator
# Uses Google Directions API with real-time traffic data.
#
# Usage:
#   driving-eta.sh "destination"              # from home
#   driving-eta.sh "destination" "origin"     # between two places
#
# Setup:
#   1. Get a Google Directions API key: https://console.cloud.google.com/
#   2. Replace YOUR_API_KEY and YOUR_HOME_ADDRESS below
#   3. chmod +x driving-eta.sh

GOOGLE_DIRECTIONS_API_KEY="YOUR_API_KEY"
HOME_ADDRESS="YOUR_HOME_ADDRESS"

DESTINATION="$1"
ORIGIN="${2:-$HOME_ADDRESS}"

if [[ "$ORIGIN" == "home" || "$ORIGIN" == "Home" || "$ORIGIN" == "HOME" ]]; then
    ORIGIN="$HOME_ADDRESS"
fi

if [[ -z "$DESTINATION" ]]; then
    echo "Usage: driving-eta.sh \"destination\" [origin]"
    echo "  origin defaults to home if not provided"
    exit 1
fi

ORIGIN_ENCODED=$(printf '%s' "$ORIGIN" | jq -sRr @uri)
DEST_ENCODED=$(printf '%s' "$DESTINATION" | jq -sRr @uri)
NOW=$(date +%s)

RESPONSE=$(curl -s "https://maps.googleapis.com/maps/api/directions/json?origin=${ORIGIN_ENCODED}&destination=${DEST_ENCODED}&departure_time=${NOW}&key=${GOOGLE_DIRECTIONS_API_KEY}")

STATUS=$(echo "$RESPONSE" | jq -r '.status')
if [[ "$STATUS" != "OK" ]]; then
    echo "Error: $STATUS"
    echo "$RESPONSE" | jq -r '.error_message // "Could not get directions"'
    exit 1
fi

DURATION_TRAFFIC=$(echo "$RESPONSE" | jq -r '.routes[0].legs[0].duration_in_traffic.text // .routes[0].legs[0].duration.text')
DISTANCE=$(echo "$RESPONSE" | jq -r '.routes[0].legs[0].distance.text')
DURATION_SECS=$(echo "$RESPONSE" | jq -r '.routes[0].legs[0].duration_in_traffic.value // .routes[0].legs[0].duration.value')

echo "🚗 Driving ETA"
echo "━━━━━━━━━━━━━━━━━━━━━"
echo "From: $ORIGIN"
echo "To:   $DESTINATION"
echo ""
echo "Distance: $DISTANCE"
echo "Drive time: $DURATION_TRAFFIC (with traffic)"
echo "Seconds: $DURATION_SECS"
