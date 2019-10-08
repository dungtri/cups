docker run --name cups -d \
    -e CUPS_USER_ADMIN=admin \
    -e CUPS_USER_PASSWORD=S@cret \
    -p 631:631/tcp \
    --device=/dev/bus/usb/xxx/yyy \
    --privileged \
    dungtri/cups-ubuntu-386:latest
