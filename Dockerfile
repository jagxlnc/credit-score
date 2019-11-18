FROM ibmcom/websphere-liberty:kernel-ubi-min
USER root
COPY src/main/liberty/config/server.xml /config
COPY target/credit-score.war /config/apps/credit-score.war
RUN chown -R 1001.0 /config /opt/ibm/wlp/usr/servers/defaultServer /opt/ibm/wlp/usr/shared/resources && chmod -R g+rw /config /opt/ibm/wlp/usr/servers/defaultServer  /opt/ibm/wlp/usr/shared/resources

USER 1001
RUN configure.sh