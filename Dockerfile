FROM mablanco/adoptopenjdk8-hotspot:222-b10
ARG VASSAL_VERSION=3.2.17
RUN apt-get -y install bzip2 libxtst6 libxrender1 libxaw7 libexpat1 libfontconfig1 && \
    wget -q http://downloads.sourceforge.net/vassalengine/VASSAL-$VASSAL_VERSION-linux.tar.bz2 && \
    mkdir -p /opt/VASSAL && \
    tar -xjf VASSAL-$VASSAL_VERSION-linux.tar.bz2 -C /opt/VASSAL --strip-components 1 && \
    rm VASSAL-$VASSAL_VERSION-linux.tar.bz2 && \
    apt-get clean
CMD ["/opt/VASSAL/VASSAL.sh"]