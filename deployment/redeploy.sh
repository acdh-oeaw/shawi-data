#!/bin/bash
# Run this script to update the VICAV instance to the latest versions. 
# It ...
# * pulls the current code of the web application from github.
# * pulls the current content of the web application from github.
# * optionally creates a backup of the dictionary data on vle-curation
# * copies it to this basex setup and restores it there
#
# Note: Assumes deploy-shawi-content.bxs
# and this file are in the root directory of your basex setup.
# It assumes SHAWI content is in the shawi-data directory
# and that the VICAV webapp is in the webapp/vicav-app directory
# Needs git.

cd $(dirname $0)

if [ ! -f redeploy.settings ]
then echo Missing settings file. Please copy redeploy.settings.dist to redeploy.settings and fill in the credentials.
fi

. redeploy.settings

if [ "$local_username"x = x -o "$local_password"x = x ]; then echo Missing credentials for local BaseX; exit 1; fi
#------ Settings ---------------------
export USERNAME=$local_username
export PASSWORD=$local_password
#-------------------------------------

#------ Update XQuery code -----------
if [ -d ${BUILD_DIR:-webapp/vicav-app} ]
then
  pushd ${BUILD_DIR:-webapp/vicav-app}
  ret=$?
  if [ $ret != "0" ]; then exit $ret; fi
  if [ "$onlytags"x = 'truex' ]
  then
    git reset --hard
    git pull
    uiversion=$(git describe --tags --abbrev=0)
  else
    git pull
    uiversion=$(git describe --tags --always)
  fi
  echo checking out UI ${uiversion}
  git -c advice.detachedHead=false checkout ${uiversion}
  find ./ -type f -and \( -name '*.js' -or -name '*.html' \) -not \( -path './node_modules/*' -or -path './cypress/*' \) -exec sed -i "s~\@version@~$uiversion~g" {} \;
  popd
fi
#-------------------------------------

#------ Update content data from redmine git repository 
echo updating shawi-data
if [ ! -d shawi-data/.git ]; then echo "shawi-data does not exist or is not a git repository"; fi
pushd shawi-data
ret=$?
if [ $ret != "0" ]; then exit $ret; fi
if [ "$onlytags"x = 'truex' ]
then
git reset --hard
git pull
dataversion=$(git describe --tags --abbrev=0)
else
git pull
dataversion=$(git describe --tags --always)
fi
echo checking out data ${dataversion}
git -c advice.detachedHead=false checkout ${dataversion}
who=$(git show -s --format='%cN')
when=$(git show -s --format='%as')
message=$(git show -s --format='%B')
sourcebaseuri=$(git remote get-url origin | sed 's~\.git$~~g')/blob/$(git rev-parse HEAD)/
revisionDesc=$(sed ':a;N;$!ba;s/\n/\\n/g' <<EOF
<revisionDesc>
  <change n="$dataversion" who="$who" when="$when">
$message
   </change>
</revisionDesc>
EOF
)
#------- copy all images into the "images" directory in the web application directory
echo "copying image files from shawi-data to vicav-webapp"
for d in $(ls -d vicav_*)
do echo "Directory $d:"
   for filename in $(find "$d" -type f -and -name '*.xml')
   do
      echo "    Adding teiSource and revisionDesc to $filename"
      publicationIdno=$(sed ':a;N;$!ba;s/\n/\\n/g' <<EOF
<idno type="teiSource">$sourcebaseuri$filename</idno>
EOF
)
      revisionDesc=$(sed ':a;N;$!ba;s/\n/\\n/g' <<EOF
<revisionDesc>
  <change n="$dataversion" who="$who" when="$when">
$message
   </change>
</revisionDesc>
EOF
)
     sed -i "s~\(</publicationStmt>\)~$publicationIdno\\n\1~g" $filename
     sed -i "s~\(</teiHeader>\)~$revisionDesc\\n\1~g" $filename
   done
   cd "$d"
   mkdir -p $(dirname "" $(find . -type f -and \( -name '*.jpg' -or -name '*.JPG' -or -name '*.png' -or -name '*.PNG' -or -name '*.svg' \) -exec echo ${BUILD_DIR:-../../webapp/vicav-app}/images/{} \;))
   find . -type f -and \( -name '*.jpg' -or -name '*.JPG' -or -name '*.png' -or -name '*.PNG' -or -name '*.svg' \) -exec mv -v {} ${BUILD_DIR:-../../webapp/vicav-app}/images/{} \;
   cd ..
done
for d in $(ls -d 103_tei_w)
do echo "Directory $d:"
for filename in $(find "$d" -type f -and -name '*Corpus.xml')
   do
      echo "    Adding teiSource to $filename"
      sed -i "s~\(<idno type=\"teiSource\">.*/blob/\)main~\1$(git rev-parse HEAD)~g" $filename
   done
done
if [ "$CI"x == "truex" ]; then echo "CI: removing .git"; rm -rf .git; fi
versionInfo=$(sed ':a;N;$!ba;s/\n/\\n/g' <<EOF
  <version>
    <backend>$uiversion</backend>
    <data>$dataversion</data>
  </version>
EOF
)
sed -i "s~\(</projectConfig>\)~$versionInfo\\n\1~g" vicav_projects/shawi.xml
popd
pushd ${BUILD_DIR:-webapp/vicav-app}
find ./ -type f -and \( -name '*.js' -or -name '*.html' \) -not \( -path './node_modules/*' -or -path './cypress/*' \) -exec sed -i "s~\@data-version@~$dataversion~g" {} \;
if [ "$CI"x == "truex" ]; then echo "CI: removing .git"; rm -rf .git; fi 
popd
sed -i "s~webapp/vicav-app/~${BUILD_DIR:-webapp/vicav-app}/~g" deploy-shawi-content.bxs
./execute-basex-batch.sh deploy-shawi-content $1
sed -i "s~../webapp/vicav-app/~${BUILD_DIR:-../webapp/vicav-app}/~g" refresh-project-config.xqtl
./execute-basex-batch.sh refresh-project-config.xqtl $1 >/dev/null
pushd shawi-data
popd
if [ "$CI"x == "truex" ]; then echo "CI: removing content repo"; rm -rf shawi-content; fi 