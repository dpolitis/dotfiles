# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
psw1 () { telnet ssh2serial 4001; }
psw2 () { telnet ssh2serial 4002; }
psw3 () { telnet ssh2serial 4003; }
psw4 () { telnet ssh2serial 4004; }
vdev1 () { telnet gns3 5001; }
vdev2 () { telnet gns3 5002; }
vdev3 () { telnet gns3 5003; }
vdev4 () { telnet gns3 5004; }
vdev5 () { telnet gns3 5005; }
vdev6 () { telnet gns3 5006; }
vdev7 () { telnet gns3 5007; }
vdev8 () { telnet gns3 5008; }
vdev9 () { telnet gns3 5009; }
termux () { adb forward tcp:8022 tcp:8022 && ssh localhost -p 8022; }

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
