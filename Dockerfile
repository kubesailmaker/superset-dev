FROM preset/superset:0.37

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

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
