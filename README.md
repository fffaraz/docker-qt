# Docker-Qt
Qt for Docker

* Linux Dynamically Linked
```
docker build --force-rm -t fffaraz/qt .
docker run --rm -it -v $(pwd):/app fffaraz/qt
```

* Linux Statically Linked
```
cd static
docker build --force-rm -t fffaraz/qt:static .
docker run --rm -it -v $(pwd):/app fffaraz/qt:static
```

* Windows Cross-compiled Statically Linked
```
cd windows
docker build --force-rm -t fffaraz/qt:windows .
docker run --rm -it -v $(pwd):/app fffaraz/qt:windows
cd /app && qmake && make -j $(nproc)
```
