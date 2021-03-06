# Manipulating Directories in Linux

## Moving Directories

To move or rename Directory:

 `mv <source_directory> <target_directory>`
 
 
 list files:
 
 `ls `
  
  include hidden files 
  `ls -a`
  
  list ownership:
 ` ls -l`
  
  these can be combined
`  ls -la`
  or 
 ` ls -al`
  
  
  When Moving Files:
  
`  mv [options] source dest`

### mv command options
mv command main options:

option	description
> mv -f	force move by overwriting destination file without prompt
> mv -i	interactive prompt before overwrite
> mv -u	update - move when source is newer than destination
> mv -v	verbose - print source and destination files
> man mv	help manual
> mv command examples

#### Examples

Move main.c def.h files to /home/usr/rapid/ directory:

> `$ mv main.c def.h /home/usr/rapid/`

 

Move all C files in current directory to subdirectory bak :

> `$ mv *.c bak`

 

Move all files in subdirectory bak to current directory :

$ mv bak/* .
  
  
  
 ## COPY Functions:
  
  To make a copy of a file called file.doc in the current directory as newfile.doc, enter:

> `$ cp file.doc newfile.doc`
> `$ ls -l *.doc`


You can copy multiple files simultaneously into another directory. 
In this example, copy the files named main.c, demo.h and lib.c into a directory named backup:
`$ cp main.c demo.h libc. backup`

If backup is located in /home/project, enter:
`$ cp main.c demo.h libc. /home/project backup`

Copy a file to another directory
To copy a file from your current directory into another directory called /tmp/, enter:
`$ cp filename /tmp`
`$ ls /tmp/filename`
`$ cd /tmp`
`$ ls`
`$ rm filename`

### Verbose option
To see files as they are copied pass the -v option as follows to the cp command:

`$ cp -v filename.txt filename.bak`
`$ cp -v foo.txt /tmp`

#### Sample outputs:
`foo.txt -> /tmp/foo.txt`


Preserve file attributes
To copy a file to a new file and preserve the modification date, time, and access control list associated with the source file, enter:
`$ cp -p file.txt /dir1/dir2/`
`$ cp -p filename /path/to/new/location/myfile`

This option (-p) forces cp to preserve the following attributes of each source file in the copy as allowed by permissions:

Modification time/date
Access time
File flags
File mode
User ID (UID)
Group ID (GID)
Access Control Lists (ACLs)
Extended Attributes (EAs)
Copying all files


The star wildcard represents anything i.e. all files. To copy all the files in a directory to a new directory, enter:
`$ cp * /home/tom/backup`

The star wildcard represents anything whose name ends with the .doc extension. So, to copy all the document files (*.doc)
in a directory to a new directory, enter:
`$ cp *.doc /home/tom/backup`

Recursive copy
To copy a directory, including all its files and subdirectories, to another directory, enter (copy directories recursively):
`$ cp -R * /home/tom/backup`

Linux copy file command with interactive option
You can get prompt before overwriting file. 
For example, if it is desired to make a copy of a file called foo
and call it bar and if a file named bar already exists, the following would
prompt the user prior to replacing any files with identical names:

`cp -i foo bar`

Verbose output with cp command
If you pass the -v to the cp, it makes tells about what is going on. That is verbose output:

`cp -v file1 file2`
`cp -avr dir2 /backups/`
  
  
### mkdir [OPTION]... DIRECTORY...
Description

 
Create the DIRECTORY(ies), if they do not already exist.

Mandatory arguments to long options are mandatory for short options too.

-m, --mode=MODE
set file mode (as in chmod), not a=rwx - umask

-p, --parents
no error if existing, make parent directories as needed

-v, --verbose
print a message for each created directory

-Z, --context=CTX
set the SELinux security context of each created directory to CTX

--help
display this help and exit
  
