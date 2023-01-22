# Automatic-Directory-Backup
Project that compares two directories, and original directory and a backup directory, whenever a change happens in the original directory, it's automatically reflected in the backup directory.

### User Manual
open command line
go to specified directory
ex:
-> cd Downloads/dir_backup
to go to the dir that has our makefile and bashcript file.

then type the following:
-> make dir=<dir to be recovered> backupdir=<dir in which to recover> interval-secs=<time in secs to periodically recover> max-backups=<max number of files to be kept>
ex:
make dir=orig_dir backupdir=backupdir interval-secs=2 max-backups=6

### Now lets look at our original directory
![image](https://images/1.png)

### Now lets look at our original directory
![image](https://images/1.png)

### Lets look at the initially empty backup directory
![image](https://images/2.png)

### Lets run the program
![image](https://images/3.png)

### what if we make changes in the original directory
![image](https://images/4.png)

