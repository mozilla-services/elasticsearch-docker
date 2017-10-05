FROM elasticsearch:1.4.5
USER root
# uid 11002 because 1000 (elasticsearch) conflicts in our infra
RUN addgroup --gid 11002 elasticsearch-user
RUN useradd --uid 11002 --gid 11002 --home /usr/share/elasticsearch elasticsearch-user
# take ownership of things elasticsearch user normally owns
RUN set -ex && for esdirs in config data logs; do \
        mkdir -p "$esdirs"; \
        chown -R elasticsearch-user:elasticsearch-user "$esdirs"; \
    done
# no x-pack (not even relevant in 1.4.5?)
ENV xpack.monitoring.enabled false
ENV xpack.security.enabled false

RUN bin/plugin install elasticsearch/elasticsearch-cloud-aws/2.4.2
USER elasticsearch-user
