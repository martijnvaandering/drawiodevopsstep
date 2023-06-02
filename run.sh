#!/bin/bash
set -e
export DISPLAY="${XVFB_DISPLAY}"
Xvfb "${XVFB_DISPLAY}" ${XVFB_OPTIONS} &

for f in /devops/*.drawio; 
do 
	drwnm=$(basename -- "$f" .drawio)
	echo $drwnm
	file="/devops/$drwnm"
	drawio "$file.drawio" --no-sandbox --export --format xml --uncompressed
	count=$(grep -o "<diagram" "$file.xml" | wc -l)
	rm "$file.xml"
	for ((i = 0 ; i <= $count-1; i++)); do
	drawio "$file.drawio" --no-sandbox --export --page-index $i --output "/devops/output/$file-$i.png"
	done
done