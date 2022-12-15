# File         : Makefile
# Last Updated : Date: Tue Dec  6 15:29:10 2022
# Abstract     : Makefile for BIST circuit.


TMPFILE		= *.log

DBFILE		= *.fsdb *.db *.sdf REPORT/*.rpt INCA_libs

RM		= rm -rf

ECHO		= echo

USAGE		= "Usage : make <BIST_name> FUNC= [ tb | tb_f | evcd | dc | fm | lint | tb_INS | tb_INS_f | tb_INS_nf ] SIM= [ ncv | vcs ]"

all :
	@$(ECHO) $(USAGE)

top_default :
ifeq ($(FUNC),tb)
  ifeq ($(SIM),vcs)
	make -f Makefile.top_default top_default_tb_vcs
  else
	make -f Makefile.top_default top_default_tb
  endif
else ifeq ($(FUNC),tb_f)
  ifeq ($(SIM),vcs)
	make -f Makefile.top_default top_default_tb_f_vcs
  else
	make -f Makefile.top_default top_default_tb_f
  endif
else ifeq ($(FUNC),evcd)
	make -f Makefile.top_default evcd
else ifeq ($(FUNC),dc)
	make -f Makefile.top_default dc
else ifeq ($(FUNC),fm)
	make -f Makefile.top_default fm
else ifeq ($(FUNC),lint)
	make -f Makefile.top_default lint
else ifeq ($(FUNC),tb_INS)
  ifeq ($(SIM),vcs)
	make -f Makefile.top_default top_default_tb_INS_vcs
  else
	make -f Makefile.top_default top_default_tb_INS
  endif
else ifeq ($(FUNC),tb_INS_nf)
  ifeq ($(SIM),vcs)
	make -f Makefile.top_default top_default_tb_INS_nf_vcs
  else
	make -f Makefile.top_default top_default_tb_INS_nf
  endif
else ifeq ($(FUNC),tb_INS_f)
  ifeq ($(SIM),vcs)
	make -f Makefile.top_default top_default_tb_INS_f_vcs
  else
	make -f Makefile.top_default top_default_tb_INS_f
  endif
else
	@$(ECHO) $(USAGE)
endif

clean :
	$(RM) $(TMPFILE) $(DBFILE)
