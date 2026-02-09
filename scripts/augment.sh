#!/bin/bash
# ----------------------------------------------
# Augment the shopping-app and inventory-hub 
# with AI-generated content
# ----------------------------------------------
FLIGHT_PLAN="dotnet run --project ../../../FlightPlan/FlightPlan/FlightPlan.csproj --"

cd ../flightplan/shopping-app
$FLIGHT_PLAN build flightplan.yaml \
    -o flightplan.compiled.json
$FLIGHT_PLAN generate ai-augmentations \
    flightplan.compiled.json \
    --model phi4 \
    --force \
    -o ./ai-augmentations.yaml

cd ../inventory-hub
$FLIGHT_PLAN build flightplan.yaml \
    -o flightplan.compiled.json
$FLIGHT_PLAN generate ai-augmentations \
    flightplan.compiled.json \
    --model phi4 \
    --force \
    -o ./ai-augmentations.yaml
