#!/bin/bash
# run this from shawi-data as 080_scripts_generic/convert-eaf.sh

mkdir -p scripts
curl -L https://github.com/christopheparisse/teicorpo/blob/master/teicorpo.jar?raw=true -o scripts/teicorpo.jar
curl -L https://repo1.maven.org/maven2/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar -o scripts/commons-io-2.11.0.jar

set -euo pipefail

function convert_eaf() {
	echo $1
	basename=$(basename "./$1")
	basename=${basename//.eaf/}
	echo ${basename}
	echo $(test -f "102_derived_tei/${basename}.xml")
	if ! test -f "102_derived_tei/${basename}.xml"; then
		java -cp './scripts/*' fr.ortolang.teicorpo.TeiCorpo -from elan -to tei "${1}" -o "102_derived_tei/${basename}.xml"
	fi
}

export -f convert_eaf

find 122_elan -name '*.eaf' -exec bash -c 'convert_eaf "$0"' {} \;
