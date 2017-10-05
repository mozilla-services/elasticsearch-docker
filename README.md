# socorro-elasticsearch-docker
docker pull mozilla/socorro_elasticsearch:$version

The new socorro infra is currently using the [1.4.5 branch](https://github.com/mozilla-services/socorro-elasticsearch-docker/tree/1.4.5), which is based on [this](https://hub.docker.com/_/elasticsearch/) image.
The elasticsearch 5 migration that we attempted used master, which was based on [this](docker.elastic.co/elasticsearch/elasticsearch:5.1.2) image.
