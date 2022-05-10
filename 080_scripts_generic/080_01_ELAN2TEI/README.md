# ELAN2TEI

This Jupyter notebook runs the full conversion workflow from source to TEI data which will be manually encoded using the TEI enricher.

## Setup

* clone this repository
* make sure you have python 3.8.10 installed[1]
  The reason for this exact version is that the github actions VM has it preinstalled.
  Later versions of Python should of course work but the code has to run in 3.8.10.
* get the dependncies using pipenv[2]: `pipenv install`
* set up environment variables SP_USERNAME and SP_PWD
  
  ```bash
  export SP_USERNAME="mySharepointUsername"
  read -p "Enter your password: " -s SP_PWD
  export SP_PWD
  ```
  
  Alternatively (and especially on Windows) you can put the environment variables down in a `.env` file. Be carefui as you would put down your password _unencrypted_!
  
  _Warning_: Never git this `.env` file!

## Start the notebook

Afterwards start the jupyter lab server: 

```bash
pipenv run jupyter-lab
```

## Configuration & Notes

* make sure you set your sharepoint username (institutional e-mail-address) in the variable `sp_username`
* following the notebook you download / install all other needed data/scripts; files already downloaded are cached, but these steps have a "Force" flag to force re-downloading the files again
* you can skip specific process steps by adding them to the list `SKIP_PROCESSING` e.g. `SKIP_PROCESSING=["runTEICorpo"]`

## Create a script file for running without the notebook GUI

```bash
pipenv run jupyter nbconvert --to script ELAN2TEI.ipynb
pipenv run python ELAN2TEI.py
```

## TODOs

* See comments in notebook – this notebook is still work in progress
* document / systematize SKIP_PROCESSING

[1] you can install [pyenv](https://github.com/pyenv/pyenv-installer) on Linux/MacOS to get the correct version for you. [pyenv-win](https://github.com/pyenv-win/pyenv-win) does the same in Windows.

[2] you need to have virtualenv installed for this: `pip install pipenv`
