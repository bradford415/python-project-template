## Makefile to automate commands like ci/cd, installing dependencies, and creating a virtual environment

## Excecutes all commands in a single shell (allows us to activate a virtual env and install dependencies in it)
.ONESHELL:

.PHONY: venv test require install create

## Variables set at declaration time
VENV_NAME := pytemplate
REQUIREMENTS := requirements.txt

## Recursively expanded variables
python_source = python

venv: ## Create virtual environment
	python -m venv .venv/${VENV_NAME} 

test: ## Put pytests here

check:

format:

require:
	pip install pip-tools
	pip-compile -o requirements.txt pyproject.toml

install:
	pip install -r ${REQUIREMENTS}
	python -m pip install -e .

create: venv install ## Create virtual environment and install dependencies and the project itself  






