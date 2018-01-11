This container is only created for development purposes and not recommended for production. It uses the `elasticsearch:2.4.6` container as base, and installs the following two plugins needed by the elastic suite module:
- analysis-phonetic
- analysis-icu

It also adds the following two configs to the configuration file of elasticsearch:
- script.inline: on
- script.indexed: on

You can start this container with the following command:

```
docker run -d -p 9200:9200 -p 9300:9300 dannyhajj/esuite-es
```

You can also use the following command to so your indexes persist every time you stop and start the container:

```
docker run -d -p 9200:9200 -p 9300:9300 --name esuite-es -v "$PWD/es-data:/usr/share/elasticsearch/data" dannyhajj/esuite-es
```


## docker-compose.yml

The previous command can be translated to the following `docker-compose.yml` file:

```
version: '3'

services:
  esuite-es:
    container_name: esuite-es
    image: dannyhajj/esuite-es
    ports:
      - "9200:9200"
      - "9300:9300"
    volumes:
      - ./es-data:/usr/share/elasticsearch/data
```

Disclaimer: I'm not affiliated with the developers of elastic suite. The elastic suite module can be found on GitHub: https://github.com/Smile-SA/elasticsuite
