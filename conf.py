version: 2

formats:
  - pdf

python:
  version: "3.9"
  install:
    - requirements: docs/requirements.txt
    - method: pip
      path: .
      extra_requirements:
        - docs
    - method: setuptools
      path: package
  system-packages: true

