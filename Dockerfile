FROM osrm/osrm-backend

WORKDIR /data

COPY dmu_campus.osm /data/map.osm

RUN osrm-extract -p /opt/foot.lua /data/map.osm && \
    osrm-partition /data/map.osrm && \
    osrm-customize /data/map.osrm

EXPOSE 5000

CMD ["osrm-routed", "--algorithm", "mld", "/data/map.osrm"]
