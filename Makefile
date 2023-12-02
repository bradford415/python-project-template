## Makefile to automate commands like ci/cd, installing dependencies, and creating a virtual environment

## Excecutes all commands in a single shell (allows us to activate a virtual env and install dependencies in it)
.ONESHELL:

.PHONY: venv test require install create

## Variables set at declaration time
PROJECT_NAME := pytemplate
VENV_NAME := pytemplate
REQUIREMENTS := requirements.txt

## Recursively expanded variables
python_source = ${PROJECT_NAME} scripts/  # Location of python files 
activate = source .venv/${VENV_NAME}/bin/activate
activate_windows = source .venv/${VENV_NAME}/Scripts/activate

venv: ## Create virtual environment
	python -m venv .venv/${VENV_NAME} 

test: ## Put pytests here
	. 
	pytest tests/

format: ## Reformats your code to a specific coding style
	${activate}
	black ${python_source}
	isort ${python_source}

format_windows:
	${activate_windows}
	black ${python_source}
	isort ${python_source} 

check:
	${activate}
	black --check ${python_source}
	isort --check-only ${python_source}
	mypy ${python_source}
	pylint ${python_source}

check_windows:
	${activate_windows}
	black --check ${python_source}
	isort --check-only ${python_source}
	mypy ${python_source}
	pylint ${python_source}

require:
	pip install pip-tools
	pip-compile -o requirements.txt pyproject.toml

install: ## Install for linux only; we also need to upgrade pip to support editable installation with only pyproject.toml file
	${activate}
	pip install --upgrade pip
	pip install -r ${REQUIREMENTS}
	python -m pip install -e .

install_windows:
	${activate_windows}
	pip install --upgrade pip
	pip install -r ${REQUIREMENTS}
	python -m pip install -e .

create: venv install ## Create virtual environment and install dependencies and the project itself  
