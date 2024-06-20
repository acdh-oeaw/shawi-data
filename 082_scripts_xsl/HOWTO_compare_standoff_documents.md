HOW to compare old versions of standoff document with current one

1. go to https://github.com/acdh-oeaw/shawi-data/commits/main/010_manannot/shawi_standoff.xml 
2. browse to the commit of the file you want compare to
3. click on the name of the commit to open the old version 
4. click on the horizontal three dots and select "View Files"
5. click on the download button and save the file at some handy place
6. open 082_scripts_xsl/standoff_comp_config.xml and add a new path element to the oldDocuments elements with the path to the downloaded document
7. in oXygen: run "compare Standoff documents" transformation scenario
