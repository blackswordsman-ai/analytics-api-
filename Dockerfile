#Download and install python
FROM python:3.13-slim-bullseye
#setup linux packages

#Create a virtual environment
RUN python -m venv /venv
#Set virtual environment as default
ENV PATH="/venv/bin:$PATH"
#Upgrade pip
RUN pip install --upgrade pip

#Set python related environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

#install os dependency for our mini om
RUN apt-get update && apt-get install -y \
    #for postgress
    libpq-dev \
    #for pillow
    libjpeg-dev \
    #for carios SVG
    libcairo2 \
    #other
    gcc \
    && rm -rf /var/lib/apt/lists/*
#create the mini vms code directory
RUN mkdir -p /code
#set the working directory to the same code directory
WORKDIR /code
#copy the requirement file into the container
COPY requirements.txt /tmp/requirements.txt     
#copy the project code into the container
COPY src /code/src
#install python project requirement
RUN pip install -r /tmp/requirements.txt



#create a bash script to run the FASTAPI
#the script will exicute runtime when
#the container starts and the database is availble

COPY boot/docker-run.sh /opt/run.sh
RUN chmod +x /opt/run.sh
# Clean up apt cache to reduce image size
RUN apt-get remove --purge -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Run the FastAPI project via the runtime script
# when the container starts
CMD ["/opt/run.sh"]


#Install python packages
#Run the application
#Fast Api hello world
