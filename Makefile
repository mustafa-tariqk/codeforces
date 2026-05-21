MAKEFLAGS += --no-print-directory

CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -DLOCAL
P = $(word 2,$(MAKECMDGOALS))

.PHONY: new run $(P)

new:
	mkdir -p $(P)
	cp template.cpp $(P)/main.cpp
	touch $(P)/in.txt
	@echo "Created $(P)/"

$(P):
	@true

.DEFAULT_GOAL := run
run:
	$(CXX) $(CXXFLAGS) $(P)/main.cpp -o $(P)/a.out && cd $(P) && ./a.out < in.txt
