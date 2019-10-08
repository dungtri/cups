FROM i386/ubuntu:18.04

MAINTAINER Dung Tri LE <geekwhynot@gmail.com>

RUN apt-get update && apt-get install -y \
	cups cups-pdf curl && \
        rm -rf /var/lib/apt/lists/* && \
	sed -i 's/Listen localhost:631/Listen 0.0.0.0:631/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/>/<Location \/>\n  Allow All/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin>/<Location \/admin>\n  Allow All\n  Require user @SYSTEM/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin\/conf>/<Location \/admin\/conf>\n  Allow All/' /etc/cups/cupsd.conf && \
	echo "ServerAlias *" >> /etc/cups/cupsd.conf && \
	echo "DefaultEncryption Never" >> /etc/cups/cupsd.conf

RUN curl https://download.brother.com/welcome/dlf006019/hl5440dlpr-3.0.0-1.i386.deb --output hl5440dlpr-3.0.0-1.i386.deb && \
    dpkg -i --force-all hl5440dlpr-3.0.0-1.i386.deb && \
    curl https://download.brother.com/welcome/dlf006021/hl5440dcupswrapper-3.0.0-1.i386.deb --output hl5440dcupswrapper-3.0.0-1.i386.deb && \
    dpkg -i --force-all hl5440dcupswrapper-3.0.0-1.i386.deb && \
    dpkg -l | grep Brother && \
    rm -f hl5440dlpr-3.0.0-1.i386.deb hl5440dcupswrapper-3.0.0-1.i386.deb && \
    apt-get purge -y curl libcurl4 libnghttp2-14 libpsl5 librtmp1 publicsuffix

VOLUME /etc/cups/ /var/log/cups /var/spool/cups /var/spool/cups-pdf /var/cache/cups

COPY start-cups.sh /root/start-cups.sh
RUN chmod +x /root/start-cups.sh

CMD ["/root/start-cups-ubuntu.sh"]

EXPOSE 631
