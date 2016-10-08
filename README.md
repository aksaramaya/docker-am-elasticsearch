# Elasticsearch Docker images
## How to build the image

Just run

```bash
make
```

To clean up the directory, run

```bash
make clean
```

## How to run the image

```
docker run -d -p 9200:9200 -it aksaramaya/elasticsearch
```
or
```
mkdir /tmp/data
docker run -v /tmp/data:/opt/es/data -d -p 9200:9200 -it aksaramaya/elasticsearch
```



## License
[MIT](LICENSE).
