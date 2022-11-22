FROM python:3.8.3
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2
# RUN pip install --upgrade pip
RUN apt-get -y install rsync
COPY . /app/
WORKDIR /app


ENV BOOKS_SCRIPT="/app"
ENV PATH=$BOOKS_SCRIPT:$PATH
COPY ./catalog_files/tmp/* ./catalog_files/tmp/cache/epub
COPY ./catalog_files/tmp/* ./catalog_files/tmp
COPY ./requirements.txt .
COPY ./entrypoint.sh .
RUN pip install -r requirements.txt
RUN chmod 755 entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]