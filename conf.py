version: 2

python:
  version: "3.8"
  install:
    - requirements: ./requirements.txt
    - method: pip
      path: .
      extra_requirements:
        - docs
	- distlib 
	- pipenv
    #- method: setuptools
    #  path: package
  system-packages: true

