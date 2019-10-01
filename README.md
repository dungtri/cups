# CUPS print server image 
[![Build Status](https://drone.dungtri.be/api/badges/dungtri/cups/status.svg)](https://drone.dungtri.be/dungtri/cups)

## Overview
Docker image including CUPS print server and printing drivers (installed from the Debian packages).

## Run the Cups server
```bash
docker run -e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=secr3t -p 6631:631/tcp aadl/cups-alpine
```
__Note__: The admin user/password for the Cups server is `print`/`print`

## Add printers to the Cups server
1. Connect to the Cups server at [http://127.0.0.1:631](http://127.0.0.1:631)
2. Add printers: Administration > Printers > Add Printer
3. (The user/password is `print`/`print`)

## Configure Cups client on your machine
1. Install the `cups-client` package
2. Edit the `/etc/cups/client.conf`, set `ServerName` to `127.0.0.1:631`
3. Test the connectivity with the Cups server using `lpstat -r`
4. Test that printers are detected using `lpstat -v`
5. The application on your machine should detect the printers !

### Included package
* cups, cups-client, cups-filters
* foomatic-db
* printer-driver-all
* openprinting-ppds
* hpijs-ppds, hp-ppd
* sudo, whois
* smbclient
