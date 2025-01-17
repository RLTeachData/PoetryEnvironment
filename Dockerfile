FROM python:3.10.16-alpine

ENV POETRY_CACHE_DIR=/tmp/poetry_cache \
    Dependency=pandas

WORKDIR /mywork
RUN touch README.md

RUN apk update && apk upgrade && apk add nano \
    && pip install --no-cache poetry \
    && poetry config virtualenvs.in-project true \
    && poetry init --name MyProject --description "A python project" --author "Your Name <your.email@example.com>" --dependency requests --dev-dependency pytest --no-interaction \
    && poetry add $Dependency \
    && poetry install --without dev --no-root && rm -rf $POETRY_CACHE_DIR

CMD ["/bin/sh"]