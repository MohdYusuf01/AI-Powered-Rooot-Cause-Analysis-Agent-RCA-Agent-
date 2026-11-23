#!/bin/bash

# Navigate to script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

echo "========================================================"
echo " Starting AI Root Cause Analysis Agent (macOS/Linux)   "
echo "========================================================"
echo ""

# Cleanup background processes on exit
cleanup() {
  echo ""
  echo "Shutting down servers..."
  kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
  exit
}
trap cleanup SIGINT SIGTERM EXIT

echo "[1/2] Starting Backend Server (Port 5001)..."
cd "$DIR/backend"
npm start &
BACKEND_PID=$!

sleep 2

echo "[2/2] Starting Frontend Console (Port 5173)..."
cd "$DIR/frontend"
npm run dev &
FRONTEND_PID=$!

echo ""
echo "========================================================"
echo " Services are running:"
echo " - Frontend:  http://localhost:5173"
echo " - Backend:   http://localhost:5001"
echo " - Demo User: harsh@test.com / password123"
echo "========================================================"
echo "Press Ctrl+C to stop both servers."

# Wait for both processes
wait
