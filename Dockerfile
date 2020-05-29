# The Windows 10 base image, compatible with Windows Server 2019
# We can't use Server Core as we need full GUI capabilities.
# See https://hub.docker.com/_/microsoft-windows
FROM mcr.microsoft.com/windows:1809-amd64

#################################################
# Chocolatey
#################################################

# Download Chocolatey Powershell install script
RUN powershell.exe Invoke-WebRequest \
  -Uri https://chocolatey.org/install.ps1 \
  -OutFile C:\chocolatey-install.ps1

# Execute the install script
RUN powershell.exe \
  -ExecutionPolicy bypass \
  -InputFormat none \
  -NoProfile \
  C:\chocolatey-install.ps1

# Append Chocolatey "bin" to the PATH
RUN setx PATH "%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

#################################################
# MinGW
#################################################

RUN choco install --yes --no-progress mingw

# Put the path before the other paths so that
# MinGW shadows Windows commands.
RUN setx PATH "C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw\bin;%PATH%"

#################################################
# MSYS
#################################################

RUN choco install --yes --no-progress --params '/NoUpdate' msys2
RUN setx PATH "C:\tools\msys64\usr\bin;%PATH%"
RUN pacman --sync --sysupgrade --refresh && pacman --sync --needed --noconfirm \
  base-devel

#################################################
# Visual C++ Build Tools
#################################################

RUN choco install --yes --no-progress vcbuildtools -ia "/Full"

# Setup Visual C++ command line tools for amd64 on the current environment
RUN call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64&set

#################################################
# Base Dependencies
#################################################

RUN choco install --yes --no-progress git
