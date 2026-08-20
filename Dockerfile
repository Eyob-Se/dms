FROM osrm/osrm-backend

COPY dmu_campus.osrm* /data/

CMD ["osrm-routed", "--algorithm", "mld", "/data/dmu_campus.osrm"]
