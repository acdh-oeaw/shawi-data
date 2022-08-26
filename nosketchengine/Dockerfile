FROM acdhch/noske:5.57.6-2.208-open
LABEL maintainer omar.siam@oeaw.ac.at

ENV CORPLIST shawi
COPY 130_vert_plain/ /var/lib/manatee/data/verticals/shawi/
COPY nosketchengine/shawi /var/lib/manatee/registry/shawi
# Build will not save anything in /var/lib/manatee/data/ as this is defined as VOLUME
USER root
RUN path=$(grep -h ^PATH $MANATEE_REGISTRY/$CORPLIST | sed -e 's/^PATH[^"]*"\(.*\)"$/\1/g'); \
    mkdir -p $path; compilecorp $CORPLIST;\
    mkdir -p /data.precompiled;\
    mv $path /data.precompiled/;\
    chown -R www-data:www-data /data.precompiled
USER www-data
CMD ["/bin/sh", "-c", "mv /data.precompiled/* /var/lib/manatee/data; exec /bin/sh /run_lighttpd.sh"]