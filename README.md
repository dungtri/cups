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

```bash
$ docker run --name cups -d \
    -e CUPS_USER_ADMIN=admin \
    -e CUPS_USER_PASSWORD=s@cr@t \
    -p 631:631/tcp \
    --device=/dev/bus/usb/xxx/xxx \
    dungtri/cups
```

## Build the ubuntu image

Checkout the project and run the following command :

```bash
$ ./build
```
