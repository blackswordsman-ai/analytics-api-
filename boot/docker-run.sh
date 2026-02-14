#!/bin/bash
source /venv/bin/activate

cd /code
RUN_PORT=${PORT:-8000}
RUN_HOST=${HOST:-0.0.0.0}

gunicorn src.main:app --workers 2 --worker-class uvicorn.workers.UvicornWorker --bind "0.0.0.0:${RUN_PORT}"