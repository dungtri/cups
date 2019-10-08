docker run --name cups -d \
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
