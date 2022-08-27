.DEFAULT_GOAL := init
.PHONY : init

init:
	@echo "XAUTH=$(shell xauth list)" > .env

