#! /usr/bin/env bash

pip install flake8
flake8 --install-hook git
git config --bool flake8.strict true
git config flake8.lazy true
