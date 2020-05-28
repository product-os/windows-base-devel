Windows Server Core Base Devel
==============================

A Windows [Server
Core](https://docs.microsoft.com/en-us/windows-server/administration/server-core/what-is-server-core)
generic Docker base image for building & testing.

The base image includes:

- [MinGW](http://mingw.org)
- [MSYS](http://www.mingw.org/wiki/msys)
- [Chocolatey](https://chocolatey.org)
- [Git](https://git-scm.com)
- [Visual C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Building Locally
----------------

```sh
docker build -t jviottidc/windows-servercore-base-devel:2019 -m 2GB .
docker push jviottidc/windows-servercore-base-devel:2019
```

License
-------

The project is licensed under the Apache 2.0 license.
