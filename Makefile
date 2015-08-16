PREFIX = /usr/local
	
modules : .gitmodules
	@echo Updating submodules
	git submodule update --init --recursive
	
install : vps_config
	@echo Installing vps_config
	ln -sF $(srcdir)/vps_config $(PREFIX)/bin

all : modules install

.PHONY: modules all install
	
