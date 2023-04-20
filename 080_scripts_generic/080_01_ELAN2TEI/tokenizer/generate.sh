rm wrapper*.xsl postTokenization/*
curl -LO https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/9.9.1-8/Saxon-HE-9.9.1-8.jar
java -jar Saxon-HE-9.9.1-8.jar -s:profile.xml -xi:on -xsl:xsl/make_xsl.xsl
mkdir -p ../../../102_derived_tei/0000-00-00
# copy a TEI corpo conversion to this dir
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_00_mergedMeta.xml -xsl:xsl/rmNl.xsl -o:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_01_nlRmd.xml
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_01_nlRmd.xml -xsl:wrapper_toks.xsl -o:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_02_toks.xml
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_02_toks.xml -xsl:wrapper_addP.xsl -o:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_03_tokenized.xml
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_03_tokenized.xml -xsl:postTokenization/1.xsl -o:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_04_posttok.xml
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_04_posttok.xml -xsl:wrapper_xtoks2vert.xsl -o:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_05_vert.xml
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_05_vert.xml -xsl:xsl/xtoks2tei.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010.xml preserve-ws=false
#java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/0000-00-00/Urfa-012_Lentils-Harran-2010_05_vert.xml -xsl:wrapper_vert2txt.xsl -o:../../../131_vert_xml/Urfa-012_Lentils-Harran-2010.xml
