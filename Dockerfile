FROM python:3.9-slim

RUN mkdir -p /usr/app/current
COPY app.py /usr/app/current/app.py
COPY requirements.txt /usr/app/current/requirements.txt

WORKDIR /usr/app/current

RUN pip3 install -r requirements.txt

HEALTHCHECK CMD curl --fail http://localhost:80/_stcore/health

ENTRYPOINT ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=80"]

EXPOSE 80
