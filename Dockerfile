FROM preset/superset:dev

RUN superset fab create-admin \
		--username admin \
		--firstname Admin \
		--lastname Admin \
		--email dev@github.com \
		--password admin
RUN superset db upgrade && superset init
USER root
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip setuptools
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org psycopg2 pyhive elasticsearch-dbapi ibm_db_sa
COPY presto.py /usr/local/lib/python3.7/site-packages/pyhive/presto.py
COPY config.py /app/superset/config.py
USER superset
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
