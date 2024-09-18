#!/bin/bash
echo "Creating Migration..."
python3 manage.py makemigrations

echo "Starting Migrations..."
python3 manage.py migrate

echo "Starting Server..."
python manage.py runserver 0.0.0.0:8000