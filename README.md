# CUPS print server image
[![Build Status](https://drone.dungtri.be/api/badges/dungtri/cups/status.svg)](https://drone.dungtri.be/dungtri/cups)

## Overview
Docker images including CUPS print server:
- Ubuntu version : A special version with official brother drivers targeted on i386 architecture.
- Alpine version : the image is very lightweight and can be run on multiple architectures : armv7, aarch64 and amd64.


## Run the Cups server
Use lsusb command to display the bus and device ids on which port your usb printer is connected.
```bash
$ lsusb
```
Return as example :
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus **001** Device **002**: ID 04f9:004a Brother Industries, Ltd
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Then use the device path /dev/bus/usb/001/002

```bash
$ docker run --name cups -d \
    -e CUPS_USER_ADMIN=admin \
    -e CUPS_USER_PASSWORD=S@cret \
    -p 631:631/tcp \
    -v /etc/cups:/etc/cups
    -v /var/log/cups:/var/log/cups
    -v /var/spool/cups:/var/spool/cups
    -v /var/spool/cups-pdf:/var/spool/cups-pdf
    -v /var/cache/cups:/var/cache/cups
    --device=/dev/bus/usb/xxx/yyy \
    dungtri/cups-ubuntu-386:latest
```

## Build the ubuntu image

Checkout the project and run the following command :

```bash
$ ./build
```
