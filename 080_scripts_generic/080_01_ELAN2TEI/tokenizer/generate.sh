rm wrapper*.xsl postTokenization/*
java -jar Saxon-HE-9.9.1-8.jar -s:profile.xml -xi:on -xsl:xsl/make_xsl.xsl
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010.xml -xsl:xsl/rmNl.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_01_nlRmd.xml
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_01_nlRmd.xml -xsl:wrapper_toks.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_02_toks.xml
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_02_toks.xml -xsl:wrapper_addP.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_tokenized.xml
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_tokenized.xml -xsl:postTokenization/1.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_posttok.xml
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_posttok.xml -xsl:wrapper_xtoks2vert.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_vert.xml
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_vert.xml -xsl:xsl/xtoks2tei.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_toks.xml preserve-ws=false
java -jar Saxon-HE-9.9.1-8.jar -s:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_vert.xml -xsl:wrapper_vert2txt.xsl -o:../../../102_derived_tei/Urfa-012_Lentils-Harran-2010_txt.xml
