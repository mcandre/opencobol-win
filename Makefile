AIP=OpenCobol-1.1.aip

all: installer

installer: $(AIP)
	AdvancedInstaller /build $(AIP)
