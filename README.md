# Docker-Qt
C++ Qt compile environment for Docker (Dynamically Linked, Statically Linked, and Cross-compiled to Windows)

* Linux Dynamically Linked
```
docker build --force-rm -t fffaraz/qt:latest .
docker run --rm -it -v $(pwd):/app fffaraz/qt:latest
```

* Linux Statically Linked
```
cd static
docker build --force-rm -t fffaraz/qt:static .
docker run --rm -it -v $(pwd):/app fffaraz/qt:static
```

* Windows Cross-compiled Statically Linked
```
cd win64
docker build --force-rm -t fffaraz/qt:win64 .
docker run --rm -it -v $(pwd):/app fffaraz/qt:win64
cd /app
qmake
make -j $(nproc)
```
