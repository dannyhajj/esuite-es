FROM elasticsearch:2.4

RUN set -x \
  && /usr/share/elasticsearch/bin/plugin install analysis-phonetic \
  && /usr/share/elasticsearch/bin/plugin install analysis-icu

RUN set -x\
  && echo "script.inline: on" >> /usr/share/elasticsearch/config/elasticsearch.yml \
  && echo "script.indexed: on" >> /usr/share/elasticsearch/config/elasticsearch.yml

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
