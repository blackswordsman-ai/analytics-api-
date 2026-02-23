1 – Download & Install Python 3
2 – Create Virtual Environment
3 – Install Python Packages
4 – FastAPI Hello World
5 – Docker Desktop & Docker Compose
6 – Production Dockerfile for FastAPI
7 – Docker-based FastAPI Hello World

{
1.first create a workspace
2.create a virtual environment
( python3.13 -m venv venv)
/Library/Frameworks/Python.framework/Versions/3.13/bin/python3
3.then have to activate venv
(source venv/bin/activate)
which python
/Users/bestway/Analytics API /venv/bin/python

4.pip install pip --upgrade
5.install python packages (setup development environment)
6.pip install -r requirements.txt
7.uvicorn src.main:app --reload 8. docker setup
9.hub.docker  
 10.install python:3.6.15
11.run the shell docker run -it python:3.6.15
12.docker build -t analytics-api -f Dockerfile .
13.docker run -p 8000:8000 analytics-api
14-automaticaly chagne dockerfile compse watch

}

becomes

- `docker compose up --watch`
- `docker compose down` or `docker compose down -v` (to remove volumes)
- `docker compose run app /bin/bash` or `docker compose run app python`

```:contentReference[oaicite:0]{index=0}
cat mai.py is show the code inside the file

Let me know if you want it in plain text without the backticks!
::contentReference[oaicite:1]{index=1}


httpx and requests  are the same actualy doing api calls

# Build the image
docker build -t analytics-api .

# Run the container
docker run -p 8000:8000 analytics-api


```
