FROM ubuntu:latest
RUN apt-get update && apt-get install -y python3.10
RUN ln -s /usr/bin/python3.10 /usr/bin/python
RUN apt-get install -y python3-pip
RUN apt install python3-venv -y
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install django
EXPOSE 8000
ENTRYPOINT ["python", "mysite/manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
