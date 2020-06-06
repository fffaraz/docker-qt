# Docker-Qt
C++ Qt compile environment for Docker (Dynamically Linked, Statically Linked, and Cross-compiled to Windows)

* Linux Dynamically Linked
```
docker build --force-rm -f Dockerfile -t fffaraz/qt:latest .
docker run --rm -it -v $(pwd):/app fffaraz/qt:latest
```

* Linux Statically Linked
```
docker build --force-rm -f Dockerfile.static -t fffaraz/qt:static .
docker run --rm -it -v $(pwd):/app fffaraz/qt:static
```

* Windows 64bit Cross-compiled Statically Linked
```
docker build --force-rm -f Dockerfile.win64s -t fffaraz/qt:win64s .
docker run --rm -it -v $(pwd):/app fffaraz/qt:win64s
cd /app
qmake
make -j $(nproc)
```
