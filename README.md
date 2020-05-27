# Docker-Qt
C++ Qt compile environment for Docker (Dynamically Linked, Statically Linked, and Cross-compiled to Windows)

* Linux Dynamically Linked
```
docker build --force-rm -t fffaraz/qt .
docker run --rm -it -v $(pwd):/app fffaraz/qt
```

* Linux Statically Linked
```
cd linux-static
docker build --force-rm -t fffaraz/qt:static .
docker run --rm -it -v $(pwd):/app fffaraz/qt:static
```

* Windows Cross-compiled Statically Linked
```
cd windows-x64
docker build --force-rm -t fffaraz/qt:windows64 .
docker run --rm -it -v $(pwd):/app fffaraz/qt:windows64
cd /app
qmake
make -j $(nproc)
```
