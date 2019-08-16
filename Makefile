#Makefile at top of application tree
TOP = .
include $(TOP)/configure/CONFIG
DIRS += configure calcApp tests
calcApp_DEPEND_DIRS = configure
ifeq ($(EPICS_HOST_ARCH),linux-x86_64)
	DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard etc))
	# Comment out the following line to disable building of example iocs
	DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard iocs))
endif
tests_DEPEND_DIRS = configure calcApp
include $(TOP)/configure/RULES_TOP
