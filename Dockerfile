# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

ENV FLASK_ENV production

EXPOSE 5000

CMD ["gunicorn", "wsgi:app", "-w 2", "-b 0.0.0.0:5000", "-t 30"]