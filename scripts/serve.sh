#!/bin/bash
# -----------------------
# Serve the documentation
# -----------------------
#FLIGHT_PLAN="dotnet run --project ../../FlightPlan/FlightPlan/FlightPlan.csproj --"
FLIGHT_PLAN="./flightplan"

$FLIGHT_PLAN serve ../docs --open