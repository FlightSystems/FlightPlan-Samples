#!/bin/bash
# -----------------------
# Build and publish
# -----------------------
FLIGHT_PLAN="dotnet run --project ../../FlightPlan/FlightPlan/FlightPlan.csproj --"

# Shopping App
$FLIGHT_PLAN publish ../flightplan/shopping-app/flightplan.yaml \
    --format markdown \
    -o ../docs/shopping-app \
    --overwrite 

# Inventory Hub
$FLIGHT_PLAN publish ../flightplan/inventory-hub/flightplan.yaml \
    --format markdown \
    -o ../docs/inventory-hub \
    --overwrite 