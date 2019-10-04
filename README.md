# CUPS print server image
[![Build Status](https://drone.dungtri.be/api/badges/dungtri/cups/status.svg)](https://drone.dungtri.be/dungtri/cups)

## Overview
Docker image including CUPS print server.

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
