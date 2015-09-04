.POSIX:
SHELL = /bin/sh
PREFIX = /usr/local

# The default target ...
all::
	
modules : .gitmodules
	@echo Updating submodules
	git submodule update --init --recursive
	
install : vps_config
	@echo Installing vps_config
	ln -sF $(srcdir)/vps_config $(PREFIX)/bin

all : modules install

.PHONY: modules all install
	



# config.mk:
# 	@echo "Please run ./configure before running make"
# 	exit 1

# include config.mk

# sourcedir = .
# PROGRAMS = shocco
# DOCS = shocco.html index.html
# DISTFILES = config.mk config.sh

all:: sup build

sup:
	echo "==========================================================="
	head -8 < README
	echo "==========================================================="

build: shocco
	echo "run \`make install' to install under $(bindir) ..."
	echo "or, just copy the \`$(sourcedir)/shocco' file where you need it."

shocco: shocco.sh
	$(SHELL) -n $<
	sed -e 's|@@MARKDOWN@@|$(MARKDOWN)|g' \
	    -e 's|@@PYGMENTIZE@@|$(PYGMENTIZE)|g' \
	< $< > shocco+
	mv shocco+ $@
	chmod 0755 $@
	echo "shocco built at \`$(sourcedir)/shocco' ..."

doc: shocco.html

shocco.html: shocco shocco.sh
	./$< $< shocco.sh > shocco.html+
	mv shocco.html+ $@

install-markdown:
	mkdir -p "$(bindir)"
	cp Markdown.pl "$(bindir)/markdown"
	chmod 0755 "$(bindir)/markdown"

install: shocco $(INSTALL_PREREQUISITES)
	mkdir -p "$(bindir)"
	cp shocco "$(bindir)/shocco"
	chmod 0755 $(bindir)/shocco

read: sup doc
	$(BROWSER) ./shocco.html

clean:
	rm -f $(PROGRAMS) $(DOCS)

distclean: clean
	rm -f $(DISTFILES)

.SUFFIXES:

.SILENT: build sup shocco



         # HostKey /etc/ssh/ssh_host_rsa_key
         # HostKey /etc/ssh/ssh_host_dsa_key
         # HostKey /etc/ssh/ssh_host_ecdsa_key
         # HostKey /etc/ssh/ssh_host_ed25519_key
         # UsePrivilegeSeparation yes
         # KeyRegenerationInterval 3600
         # ServerKeyBits 1024
         # SyslogFacility AUTH
         # LogLevel INFO
         # LoginGraceTime 120
         # PermitRootLogin no
         # StrictModes yes
         # RSAAuthentication yes
         # PubkeyAuthentication yes
         # IgnoreRhosts yes
         # RhostsRSAAuthentication no
         # HostbasedAuthentication no
         # PermitEmptyPasswords no
         # ChallengeResponseAuthentication no
         # X11Forwarding yes
         # X11DisplayOffset 10
         # PrintMotd no
         # PrintLastLog yes
         # TCPKeepAlive yes
         # AcceptEnv LANG LC_*
         # Subsystem sftp /usr/lib/openssh/sftp-server
         # UsePAM yes
         # AllowUsers demo
				 
				 
				 
				 # Port 22
				 # Use these options to restrict which interfaces/protocols sshd will bind to
				 #ListenAddress ::
				 #ListenAddress 0.0.0.0
				 # Protocol 2
				 # HostKeys for protocol version 2
				 # HostKey /etc/ssh/ssh_host_rsa_key
				 # HostKey /etc/ssh/ssh_host_dsa_key
				 # HostKey /etc/ssh/ssh_host_ecdsa_key
				 # HostKey /etc/ssh/ssh_host_ed25519_key
				 #Privilege Separation is turned on for security
				 # UsePrivilegeSeparation yes

				 # Lifetime and size of ephemeral version 1 server key
				 # KeyRegenerationInterval 3600
				 # ServerKeyBits 1024

				 # Logging
				 # SyslogFacility AUTH
				 # LogLevel INFO

				 # Authentication:
				 # LoginGraceTime 120
				 # PermitRootLogin yes
				 # PermitTunnel yes
				 # PermitTunnel yes
				 # StrictModes yes

				 # RSAAuthentication yes
				 # PubkeyAuthentication yes
				 #AuthorizedKeysFile	%h/.ssh/authorized_keys

				 # Don't read the user's ~/.rhosts and ~/.shosts files
				 # IgnoreRhosts yes
				 # For this to work you will also need host keys in /etc/ssh_known_hosts
				 # RhostsRSAAuthentication no
				 # similar for protocol version 2
				 # HostbasedAuthentication no
				 # Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication
				 #IgnoreUserKnownHosts yes

				 # To enable empty passwords, change to yes (NOT RECOMMENDED)
				 # PermitEmptyPasswords no

				 # Change to yes to enable challenge-response passwords (beware issues with
				 # some PAM modules and threads)
				 # ChallengeResponseAuthentication no

				 # Change to no to disable tunnelled clear text passwords
				 #PasswordAuthentication yes

				 # Kerberos options
				 #KerberosAuthentication no
				 #KerberosGetAFSToken no
				 #KerberosOrLocalPasswd yes
				 #KerberosTicketCleanup yes

				 # GSSAPI options
				 #GSSAPIAuthentication no
				 #GSSAPICleanupCredentials yes

				 # X11Forwarding yes
				 # X11DisplayOffset 10
				 # PrintMotd no
				 # PrintLastLog yes
				 # TCPKeepAlive yes
				 #UseLogin no

				 #MaxStartups 10:30:60
				 #Banner /etc/issue.net

				 # Allow client to pass locale environment variables
				 # AcceptEnv LANG LC_*
# 
				 # Subsystem sftp /usr/lib/openssh/sftp-server

				 # Set this to 'yes' to enable PAM authentication, account processing,
				 # and session processing. If this is enabled, PAM authentication will
				 # be allowed through the ChallengeResponseAuthentication and
				 # PasswordAuthentication.  Depending on your PAM configuration,
				 # PAM authentication via ChallengeResponseAuthentication may bypass
				 # the setting of "PermitRootLogin yes
				 # If you just want the PAM account and session checks to run without
				 # PAM authentication, then enable this but set PasswordAuthentication
				 # and ChallengeResponseAuthentication to 'no'.
				 # UsePAM yes
				 