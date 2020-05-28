FROM mcr.microsoft.com/windows/servercore:ltsc2019

#################################################
# Install Chocolatey
#################################################

RUN powershell.exe Invoke-WebRequest \
  -Uri https://chocolatey.org/install.ps1 \
  -OutFile C:\chocolatey-install.ps1
RUN powershell.exe \
  -ExecutionPolicy bypass \
  -InputFormat none \
  -NoProfile \
  C:\chocolatey-install.ps1
RUN set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

#################################################
# Base Dependencies
#################################################

RUN choco install --yes --no-progress git mingw 
RUN choco install --yes --no-progress --params '/NoUpdate' msys2

# Put the path before the other paths so that 
# MinGW shadows Windows commands.
# TODO: Fix this
RUN set "C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw\bin;PATH=%PATH%"

RUN setx PATH "C:\tools\msys64\usr\bin;%PATH%"
RUN pacman -Syu
RUN pacman -Su
RUN pacman -S base-devel --needed --noconfirm

#################################################
# Visual C++ Build Tools
#################################################

RUN choco install --yes --no-progress vcbuildtools -ia "/Full"
