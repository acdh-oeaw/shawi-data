#!/bin/bash

set -euo pipefail

function convert_eaf() {
	echo $1
	basename=$(echo $(basename ./$1) | sed s/.eaf//g)
	echo ${basename}
	echo $(test -f "102_derived_tei/${basename}.xml")
	if ! test -f "102_derived_tei/${basename}.xml"; then
		java -cp ./scripts/teicorpo.jar fr.ortolang.teicorpo.TeiCorpo -from elan -to tei ${1} -o 102_derived_tei/${basename}.xml
	fi
}

export -f convert_eaf

find 121_elan/*.eaf -exec bash -c 'convert_eaf "$0"' {} \;
