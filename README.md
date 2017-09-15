# docker-qt
Qt for Docker

```
docker build --force-rm -t fffaraz/qt .
docker run --rm -it --entrypoint /bin/bash fffaraz/qt
```

```
cd static
docker build --force-rm -t fffaraz/qt:static .
docker run --rm -it --entrypoint /bin/bash fffaraz/qt:static
```

```
cd windows
docker build --force-rm -t fffaraz/qt:windows .
docker run --rm -it --entrypoint /bin/bash fffaraz/qt:windows
```
