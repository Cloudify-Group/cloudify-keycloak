FROM quay.io/keycloak/keycloak:24.0.3

WORKDIR /opt/keycloak

COPY --chown=keycloak:keycloak ./src/main/resources/realms /opt/keycloak/data/import
COPY --chown=keycloak:keycloak ./conf/replace-env-vars.sh /replace-env-vars.sh
COPY --chown=keycloak:keycloak ./src/main/resources/themes /opt/keycloak/themes

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "-c", "/replace-env-vars.sh && /opt/keycloak/bin/kc.sh start-dev --import-realm"]