PY = python3.9 -O -m compileall -b -q -f
SRC = easyocr utils *.py
TARGETS = build
TEMP = 
all: clean $(TARGETS)

$(TARGETS):
	@echo "Compiling ..."
	@mkdir $(TARGETS)
	@cp -r $(SRC) $(TARGETS)/
	-$(PY) $(TARGETS)
	@find $(TARGETS) -name '*.py' -delete
	@find $(TARGETS) -name "__pycache__" |xargs rm -rf
	@rm $(TARGETS)/settings.pyc

clean:
	@echo "Clean ..." 
	@find . -name "__pycache__" | xargs rm -rf
	@find . -name '*.pyc' -delete
	@rm -rf $(TARGETS) $(TEMP)
