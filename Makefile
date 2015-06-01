TARGET := `guile -c "(display (car %load-path))"`

all:
	@echo "Just type \"sudo make install\""

install:
	cp -fr csv/csv.scm $(TARGET)
