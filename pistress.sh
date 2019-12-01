#!/bin/bash

counter=0

echo "Enter the number of cycles you want the stress test for: "
read cycle
clear

ans=$((cycle*120))
while :
do
  $((counter++))
  echo "$(date) @ $(hostname)"
  echo "Cycle number: $counter " 
  stress --cpu 20 --io 20 --vm 6 --vm-bytes 25M --timeout 120s 
  cpu=$(</sys/class/thermal/thermal_zone0/temp)
  echo "-------------------------------------------"
  echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
  echo "CPU => $((cpu/1000))'C"
  echo "Cycle finished.."
  echo "-------------------------------------------"
  echo
  echo
  echo

  if ((counter ==  cycle)); then 
      break 
  fi
done

echo "Stress test finished... Total elapsed time is $ans seconds.."
echo "Thanks for using..."


# add an array and put the values in it and the show it after the test is done
