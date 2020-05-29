Windows Base Devel
==================

A Windows 10 generic Docker base image for building & testing.

The base image includes:

- [MinGW](http://mingw.org)
- [MSYS](http://www.mingw.org/wiki/msys)
- [Chocolatey](https://chocolatey.org)
- [Git](https://git-scm.com)
- [Visual C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Building Locally
----------------

```sh
docker build -t jviottidc/windows-base-devel:2019 -m 2GB .
docker push jviottidc/windows-base-devel:2019
```

License
-------

The project is licensed under the Apache 2.0 license.
