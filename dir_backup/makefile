all: create run

create:
	@mkdir -p $(backupdir)
	
run:
	@echo runnig your bash file...
	@./backupd.sh $(dir) $(backupdir) $(interval-secs) $(max-backups)
