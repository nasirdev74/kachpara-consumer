#!/bin/bash

start_time=$(date '+%s')

echo "🚀 Starting script execution..."

set -e

function on_timeout() {
  echo "Timeout occurred while running command $1"
  exit 1
}



# Prerequisite commands
prereq_commands=(
  "curl http://127.0.0.1:5001/restaurant-app-25f83/us-central1/cleanup"
  "emulator -avd Pixel_3a_API_32_arm64-v8a -wipe-data -change-language tr-TR &"
)

# Launch the prerequisite commands in the background
for command in "${prereq_commands[@]}"; do
  eval $command
done

# Wait for some time after launching the prerequisite commands
hourglass="⏳"

# animate the waiting period
for i in $(seq 1 60); do
  echo -ne "$hourglass Waiting... ($i/10)\r"
  sleep 1
done


timestamp=$(date +%Y%m%d%H%M%S)

# Get a list of files in a directory
files=(  
  first_purchase_promotion_test.dart
  claim_free_promotion.dart
  student_earn_reward_test.dart
)

# Generate commands from the list of files
for file in "${files[@]}"; do
  command="flutter test integration_test/scenarios/$file"
  # Add the command to an array
  commands+=("$command")
done

for i in "${!commands[@]}"; do
  # "${commands[$i]}" 2>&1 | tee "integration_test/logs/${i}_${timestamp}.log" &
  eval ${commands[$i]} 2>&1 | tee "integration_test/logs/${i}_${timestamp}.log" 
  # pid=$!
  # trap "on_timeout $i; kill $pid" SIGALRM
  # wait $pid
done

end_time=$(date +%s)

echo "🛬 Script execution completed."
echo "⏰ Script execution time: $((end_time - start_time)) seconds"

# Rotate log files if there are already two versions
for i in "${!commands[@]}"; do
  if [ -f "${commands[$i]}_$(date +%Y%m%d%H%M%S -d "2 days ago").log" ] && [ -f "${commands[$i]}_$(date +%Y%m%d%H%M%S -d "1 day ago").log" ]; then
    rm "${commands[$i]}_$(date +%Y%m%d%H%M%S -d "2 days ago").log"
  fi
done
