# Guide to Python on Raspberry Pi




# Virtual Environments

1. Install Python venv

`sudo apt-get install python3-venv`

2. To Create a new project in a venv

`python3 -m venv hello`

3. pyvenv.cfg should be created. Dump its contents to screen

` cat pyenv.cfg`

4 Navigate to hello folder and activate environment

`cd hello`

`source /hello/bin/activate`

To Deactivate

`deactivate`

## To Remove an Environment

navigate to folder

rm -rf hello

