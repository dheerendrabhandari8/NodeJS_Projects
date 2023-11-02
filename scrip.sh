#!/bin/bash

# Check if port 8001 is in use
if lsof -i :8001 | grep LISTEN; then
  # Port 8001 is in use, so we need to kill the process
  echo "Port 8001 is in use. Killing the process..."
  # Find the process using port 8001 and kill it
  pid=$(lsof -t -i :8001)
  if [ -n "$pid" ]; then
    kill -9 $pid
    echo "Process with PID $pid killed."
  else
    echo "Unable to find the process using port 8001."
  fi
else
  # Port 8001 is not in use, so do nothing
  echo "Port 8001 is not in use. No action needed."
fi
