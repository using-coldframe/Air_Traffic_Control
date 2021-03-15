CASE_EXCEPTIONS = case_exceptions
COLDFRAMEOUT = Temp
MODELS = .
include $(COLDFRAME)/Makefile.inc

all: \
 domain_tests

domain_tests: \
 Air_Traffic_Controller.test/test_air_traffic_controller

Air_Traffic_Controller.test/test_air_traffic_controller:\
 Air_Traffic_Controller.gen \
 Air_Traffic_Controller.impl \
 Air_Traffic_Controller.test/Air_Traffic_Controller_Test.gpr
	- gnatmake -p -P Air_Traffic_Controller.test/Air_Traffic_Controller_Test

# ArgoUML support

NORM_FILES = \
 Air_Traffic_Controller.norm

# NB! the ';' at the end is important - without it, Make may not know
# to rebuild the .gen directories.
$(NORM_FILES): Air_Traffic_Control.norm-stamp ;

test: \
 test_domains

test_domains: \
 test_air_traffic_controller_domain

test_air_traffic_controller_domain: Air_Traffic_Controller.test/test_air_traffic_controller
	Air_Traffic_Controller.test/test_air_traffic_controller

clean:
	- gnatclean -q -P Air_Traffic_Controller.test/Air_Traffic_Controller_Test
	- rm -rf *.gen
	- rm -f *.norm
	- rm -f *.norm-stamp
	- rm -f Temp/*