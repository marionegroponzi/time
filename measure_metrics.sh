#!/bin/bash
CLI_PROGRAM=$@

# Get the last argument
LAST_ARG="${!#}"

# Log file
LOG_FILE="program_metrics.log"

# Get the executable size
EXECUTABLE_SIZE=$(stat -f "%z" "$LAST_ARG")

# Run the program and measure time and memory usage
gtime -f "Peak memory usage: %M kB\nElapsed time: %E" $CLI_PROGRAM 2> metrics.tmp

# Extract relevant information from /usr/bin/time output
PEAK_MEMORY_USAGE=$(grep "Peak memory usage:" metrics.tmp | awk '{print $4}')
TIME_TAKEN=$(grep "Elapsed time:" metrics.tmp | awk '{print $3}')

# Log the metrics
{
  echo "Command: $CLI_PROGRAM"
  echo "Executable size: $EXECUTABLE_SIZE bytes"
  echo "Peak memory usage: $PEAK_MEMORY_USAGE kB"
  echo "Time taken to run: $TIME_TAKEN"
  echo ""
} >> "$LOG_FILE"

# Clean up temporary file
rm metrics.tmp

echo "Metrics logged to $LOG_FILE"