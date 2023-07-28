FROM python:3.9-slim-buster
WORKDIR /flask-jenkins-cicd
COPY ./requirements.txt /flask-jenkins-cicd/
RUN pip install -r requirements.txt
COPY . .
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
