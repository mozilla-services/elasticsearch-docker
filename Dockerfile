FROM docker.elastic.co/elasticsearch/elasticsearch:5.3.3
USER root
RUN adduser -u 11002 -g 11002 -D -h /usr/share/elasticsearch elasticsearch-user
RUN set -ex && for esdirs in config data logs; do \
        mkdir -p "$esdirs"; \
        chown -R elasticsearch-user:elasticsearch-user "$esdirs"; \
    done
RUN chown elasticsearch-user:elasticsearch-user config/elasticsearch.yml config/log4j2.properties bin/es-docker && \
    chmod 0750 bin/es-docker
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin remove x-pack
USER elasticsearch-user
