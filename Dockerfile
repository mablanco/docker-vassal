FROM mablanco/adoptopenjdk8-hotspot
ARG VASSAL_VERSION=3.2.17
RUN apt-get -yq install bzip2 libxtst6 libxrender1 libxaw7 libexpat1 libfontconfig1 && \
    wget -q http://downloads.sourceforge.net/vassalengine/VASSAL-$VASSAL_VERSION-linux.tar.bz2 && \
    mkdir -p /opt/VASSAL && \
    tar -xjf VASSAL-$VASSAL_VERSION-linux.tar.bz2 -C /opt/VASSAL --strip-components 1 && \
    rm VASSAL-$VASSAL_VERSION-linux.tar.bz2 && \
    apt-get -yq autoremove && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}
CMD ["/opt/VASSAL/VASSAL.sh"]
