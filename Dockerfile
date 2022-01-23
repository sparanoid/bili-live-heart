FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

CMD [ "python", "index.py" ]
