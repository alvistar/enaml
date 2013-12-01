# Note: This is meant for enaml developers, not for end users
#       To install Enaml, please use setup.py.

.PHONY: all clean test cover

all:  
	make clean
	pip install -e .

clean:
	rm -rf build
	find . -name "*.pyc" -o -name "*.py,cover" | xargs rm -f

test: 
	make clean
	python -m py.test
	python setup.py check -r
	
cover: 
	make clean
	coverage run --source enaml -m py.test
	coverage report

release:
	make clean
	python setup.py register
	python setup.py sdist --formats=gztar,zip upload
