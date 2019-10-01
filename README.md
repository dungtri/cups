# CUPS print server image 
[![Build Status](https://drone.dungtri.be/api/badges/dungtri/cups/status.svg)](https://drone.dungtri.be/dungtri/cups)

## Overview
Docker image including CUPS print server.

## Run the Cups server
```bash
docker run -e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=secr3t -p 6631:631/tcp aadl/cups-alpine
```
