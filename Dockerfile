FROM python:3.11

ENV PYTHONUMBUFFERED=1

SHELL ["/bin/bash", "-c"]

WORKDIR /app



RUN pip install --upgrade pip "poetry==1.5.1"
RUN poetry config virtualenvs.create false --local
COPY poetry.lock pyproject.toml ./
RUN poetry install


COPY . /app

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]