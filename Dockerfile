FROM python:3.10.16-alpine

WORKDIR /mywork

RUN apk update && apk upgrade && apk add sudo \
    && pip install poetry \
    && poetry config virtualenvs.in-project true

CMD ["poetry", "run", "python", "main.py"]