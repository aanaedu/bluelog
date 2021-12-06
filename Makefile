setup:
	# Create python virtualenv & source it
	# source ~/.venvs/repo/bin/activate
	python3 -m venv ~/.venvs/repo

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	# Install hadolint
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	chmod +x ./hadolint

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202,E1101,W0212 bluelog

test:
	python -m pytest -vv tests/*.py

all: install lint test
