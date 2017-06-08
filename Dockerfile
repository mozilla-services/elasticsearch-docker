# this version is based on alpine
FROM docker.elastic.co/elasticsearch/elasticsearch:5.3.3
USER root
# uid 11002 because 1000 (elasticsearch) conflicts in our infra
RUN adduser -u 11002 -g 11002 -D -h /usr/share/elasticsearch elasticsearch-user
# take ownership of things elasticsearch user normally owns
RUN set -ex && for esdirs in config data logs; do \
        mkdir -p "$esdirs"; \
        chown -R elasticsearch-user:elasticsearch-user "$esdirs"; \
    done
RUN chown elasticsearch-user:elasticsearch-user config/elasticsearch.yml config/log4j2.properties bin/es-docker && \
    chmod 0750 bin/es-docker
# no x-pack
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin remove x-pack
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install discovery-ec2
USER elasticsearch-user
