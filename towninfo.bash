#!/bin/bash

echo "Usage: separate multi-worded cities/states by _ and not space.  Do not provide state arg for larger cities such as New_York_City, Los_Angeles or Chicago"

city="$(perl -ne 'print ucfirst()' <<< "$1" | perl -pe 's/(_\w)/\U$1/g')"
state="$(perl -ne 'print ucfirst()' <<< "$2" | perl -pe 's/(_\w)/\U$1/g')"

if [[ $state != "" ]]
then
	state="$(echo ",_$state")"
fi

bash towntozip.bash $city $state
bash towntotime.bash $city $state
bash towntocounty.bash $city $state
bash towntoareacode.bash $city $state

