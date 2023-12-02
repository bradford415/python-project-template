# Python Project Template
A Python project template for writing readable, quality code that can be installed as a package.

## File Structure

    .
    ├── pytemplate                   # Your project/package source files
    ├── scripts                      # The files you run to call your project (python run.py)
    ├── tests                        # PyTest files
    ├── Makefile                     # Automate commands (formatting, creating venvs, etc.)
    └── pyproject.toml

## Makefile

## Linting and Formatting
This project, for the most part, follows the [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html). A few exceptions are made such as line `max-line-length=120` in `pylintrc`

Below are a list of linters and formatters that are used in this project.

 - __mypy__ is a static type checker. Type checkers help ensure that you’re using variables and functions in your code correctly. With mypy, add type hints (PEP 484) to your Python programs, and mypy will warn you when you use those types incorrectly.
 - __black__ reformats your code to adhere to a strict style. This style is very readable allowing code reviews to go faster and one does not have to worry about formatting their code manually.
 - __isort__ reformats your `import` statements alphabetically and separates them by Python internal libraries, 3rd party libraries from `pypi`, and local modules from the current project.
 - __pylint__ is a static code analyzer that looks for errors and improvements in your code without running it.  Pylint isn't perfect so some suggestions can be overwritten. `pylintrc` controls most of the Pylint settings.
