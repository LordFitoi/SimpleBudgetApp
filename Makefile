SHELL := /bin/bash
PYTHON_ENV = . venv/bin/activate && 
NODE_ENV = npm run --prefix vue_frontend/

build:
	python3 -m venv venv
	$(PYTHON_ENV) pip3 install -r requirements.txt
	npm install --prefix vue_frontend
	
migrations:
	$(PYTHON_ENV) python manage.py makemigrations
	$(PYTHON_ENV) python manage.py migrate

vue_build:
	$(NODE_ENV) build

start:
	$(PYTHON_ENV) python manage.py runserver


build_and_start: build migrations vue_build start

vue_dev:
	$(NODE_ENV) dev

sass_compile:
	$(PYTHON_ENV) python manage.py sass zero_note/static/scss/style.scss zero_note/static/css/style.min.css --watch -t compressed
