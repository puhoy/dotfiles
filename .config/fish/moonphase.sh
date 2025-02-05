#!/bin/bash
#
# https://gist.github.com/Crysknife007/29b00826c86b9a91945ce6e4efccc2b5
#
# Calculate approximate moon phase
moonphase(){

  local lp=2551443
  local now=$(date -u +"%s")
  local newmoon=592500
  local phase=$((($now - $newmoon) % $lp))
  local phase_number=$((((phase / 86400) + 1)*100000))

  # Multiply by 100000 so that we can do integer comparison in bash.
  if   [ $phase_number -lt 184566 ];   then phase_icon="○ New"            
  elif [ $phase_number -lt 553699 ];   then phase_icon="❩ Waxing Crescent" 
  elif [ $phase_number -lt 922831 ];   then phase_icon="◗ First Quarter"  
  elif [ $phase_number -lt 1291963 ];  then phase_icon="◑ Waxing Gibbous"  
  elif [ $phase_number -lt 1661096 ];  then phase_icon="● Full"            
  elif [ $phase_number -lt 2030228 ];  then phase_icon="◐ Waning Gibbous"  
  elif [ $phase_number -lt 2399361 ];  then phase_icon="◖ Last Quarter"    
  elif [ $phase_number -lt 2768493 ];  then phase_icon="❨ Waning Crescent" 
  else
                                            phase_icon="○ New"             
  fi

  # Get the current phase day
  number=$(($phase_number/100000));

  # Echo the current Moon Phase Icon, name, and day number
  echo $phase_icon Moon. Day $number

}

# Run the function
moonphase
