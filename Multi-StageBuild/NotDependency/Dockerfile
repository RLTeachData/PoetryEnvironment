FROM python:3.10.16-alpine as base

ENV POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /BaseData
RUN touch README.md

RUN pip install --no-cache poetry \
    && poetry config virtualenvs.in-project true \
    && poetry init --name MyProject --description "A python project" --author "Your Name <your.email@example.com>" --dependency requests --dev-dependency pytest --no-interaction \
    && poetry install --without dev --no-root && rm -rf $POETRY_CACHE_DIR

FROM python:3.10.16-alpine as runtime

WORKDIR /mywork

ENV PATH="/mywork/.venv/bin:$PATH"

RUN apk update && apk upgrade && apk add nano

COPY --from=base /BaseData/.venv /mywork/.venv

CMD ["/bin/sh"]