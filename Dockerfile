FROM python:3.8-slim-buster
WORKDIR /opt
RUN pip install Flask
COPY . .
EXPOSE 5000
CMD ["puthon","app.py","--host=0.0.0.0"]