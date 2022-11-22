#!/bin/bash
python ./manage.py migrate

python ./manage.py updatecatalog
python ./manage.py collectstatic

 

# python ./manage.py runserver ${BIND_HOST}:${BIND_PORT}

python ./manage.py runserver 0.0.0.0:8000