#!/bin/bash

# Determine the hostname used for the system, if not overridden by APP_HOSTNAME, defaults to the value of `hostname -f`
_app_hostname=${APP_HOSTNAME:=$(hostname -f)}
_system_user_privileges="${_app_hostname},group,admin,manager,viewer,system-admin,system-history,systembundles"

_ldap_port=${LDAP_PORT:=1636}

###### File Location Constants ######
_app_etc=${APP_HOME}/etc
_app_bin=${APP_HOME}/bin
_app_keystores=${_app_etc}/keystores
_app_local_ca=${_app_etc}/certs/demoCA
_system_properties_file=${_app_etc}/system.properties
_users_properties_file=${_app_etc}/users.properties
_users_attributes_file=${_app_etc}/users.attributes
_karaf_shell_config_file=${_app_etc}/org.apache.karaf.shell.cfg
_setenv_file=${_app_bin}/setenv
_server_keystore_file=${_app_keystores}/serverKeystore.jks
_server_truststore_file=${_app_keystores}/serverTruststore.jks
_idp_client_config_file=${_app_etc}/org.codice.ddf.security.idp.client.IdpMetadata.config
#####################################

###### Property Key Constants ######
# Basic System
_system_hostname_key="org.codice.ddf.system.hostname"
_system_sitename_key="org.codice.ddf.system.siteName"
_system_https_port_key="org.codice.ddf.system.httpsPort"
_system_http_port_key="org.codice.ddf.system.httpPort"
_system_internal_http_port="org.codice.ddf.system.internalHttpPort"
_system_internal_https_port="org.codice.ddf.system.internalHttpsPort"
_default_http_port=8181
_default_https_port=8993
# Solr
_solr_client_key="solr.client"
_solr_http_url_key="solr.http.url"
_solr_cloud_url_key="solr.cloud.zookeeper"
_solr_data_key="solr.data.dir"
# Ldap
_ldap_hostname_key="org.codice.ddf.ldap.hostname"
_ldap_port_key="org.codice.ddf.ldap.port"
# IdP
_idp_metadata_key="metadata"
_idp_service_pid_key="service.pid"
_idp_service_pid_value="org.codice.ddf.security.idp.client.IdpMetadata"
_idp_useragent_key="userAgentCheck"
_idp_useragent_value="true"
####################################

###### Client Settings ######
_karaf_client_delay=${KARAF_CLIENT_DELAY:=10}
_karaf_client_retries=${KARAF_CLIENT_RETRIES:=12}
_client="${_app_bin}/client -r ${_karaf_client_retries} -d ${_karaf_client_delay}"
#############################
