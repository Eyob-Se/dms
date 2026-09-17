FROM osrm/osrm-backend:latest

WORKDIR /data

COPY dmu_campus.osm /data/dmu_campus.osm

RUN osrm-extract -p /opt/foot.lua /data/dmu_campus.osm && \
    osrm-partition /data/dmu_campus.osrm && \
    osrm-customize /data/dmu_campus.osrm

CMD ["sh", "-c", "osrm-routed --algorithm mld --port ${PORT:-5000} /data/dmu_campus.osrm"]
