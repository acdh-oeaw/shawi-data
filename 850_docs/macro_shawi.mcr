<macros>
  showForm('prot');
  showForm('inspector');

  setRootPath('C:\Users\kmoerth\ch_data\_projects\shawi\R_Shawi_19367\009_src_origs', '*.xml', 'copyToFileList');

  <!-- ********************************************************************* -->
  <!-- ** Produce an XML document to be converted into exb ***************** -->
  <!-- ********************************************************************* -->
  openEmptyEditor('newDocFromTemplate');

  <!-- ********************************************************************* -->
  <!-- *** Copy table in word document to clipboad ************************* -->
  <!-- ********************************************************************* -->
  insertTableFromClipboard('EDITOR: tei_001.xml', '</head>');
  doAttribute('EDITOR: tei_001.xml', 'txt2', '//tei:cell[2]', 'xml:lang', 'ar');
  doAttribute('txt2', 'txt2', '//tei:cell[3]', 'xml:lang', 'en');
  doAttribute('txt2', 'txt2', '//tei:cell[1]', 'n', 'computeTimeSlots');

  <!-- ********************************************************************* -->
  <!-- *** Create exmaralda input ****************************************** -->
  <!-- ********************************************************************* -->
  table2exb('txt2', 'txt3', '../611_audio_wav/STE-072.wav');
  saveFile('txt3', 'C:\Users\kmoerth\ch_data\_projects\shawi\R_Shawi_19367\121_exb\urfa_072_life_in_former_times__input.exb', '', '', 'exb', '');

  <!-- ********************************************************************* -->
  <!-- *** Process in EXMERALDA ******************************************** -->
  <!-- *** Convert output with TEI Drop ************************************ -->
  <!-- ********************************************************************* -->

  <!-- Insert annotationBlocks manually  *********************************** -->

  setIDs('EDITOR: urfa_072_life_in_former_times__TEI.xml', 'EDITOR: urfa_072_life_in_former_times__TEI.xml', '//tei:u', 'uid_', '', '');
  replacestring('EDITOR: urfa_072_life_in_former_times__TEI.xml', 'EDITOR: urfa_072_life_in_former_times__TEI.xml', '<u ', '<u xml:lang="ar" ');


  <!-- Add annotationBlocks manually *************************************** -->
  <!-- Add  u elements for the translations ******************************** -->
  <!-- Tokenise all ******************************************************** -->
  <!-- Create annotations ************************************************** -->
  <!-- Create IDs on tokens ************************************************ -->
  <!-- Create Noske vert *************************************************** -->

</macros>
