# Purpose
The OpenWMS.org Preferences Service deals with configuration and preferences for the whole application. It can be used to store
configuration parameters in different validity scopes. Scopes can be merged and inherited. Preferences might be stored only valid for a
particular *User* or a specific *Role*, specific to a *Module* (aka microservice) or the whole *Application*.  

# Resources

| Module      | Build Status                                                                                                                                                                                                                | Quality | License | Maven Central                                                                                                                                                                 | Docker Hub | Chat |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|------|
| Image       | [![Build status](https://github.com/openwms/org.openwms.core.preferences/actions/workflows/master-build.yml/badge.svg)](https://github.com/openwms/org.openwms.core.preferences/actions/workflows/master-build.yml)         | --        | [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)       | --                                                                                                                                                                            | [![Docker pulls](https://img.shields.io/docker/pulls/openwms/org.openwms.core.preferences)](https://hub.docker.com/r/openwms/org.openwms.core.preferences)           | [![Join the chat at https://gitter.im/openwms/org.openwms](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/openwms/org.openwms?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |
| [Library](https://github.com/openwms/org.openwms.core.preferences.lib) | [![Build status](https://github.com/openwms/org.openwms.core.preferences.lib/actions/workflows/master-build.yml/badge.svg)](https://github.com/openwms/org.openwms.core.preferences.lib/actions/workflows/master-build.yml) | [![Quality](https://sonarcloud.io/api/project_badges/measure?project=org.openwms:org.openwms.core.preferences.lib&metric=alert_status)](https://sonarcloud.io/dashboard?id=org.openwms:org.openwms.core.preferences.lib) | [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/openwms/org.openwms.core.preferences.lib/blob/master/LICENSE) | [![Maven central](https://img.shields.io/maven-central/v/org.openwms/org.openwms.core.preferences.lib)](https://search.maven.org/search?q=a:org.openwms.core.preferences.lib) | --           | [![Join the chat at https://gitter.im/openwms/org.openwms](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/openwms/org.openwms?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |

**Find further Documentation on [Microservice Website](https://openwms.github.io/org.openwms.core.preferences)** or in the **[Wiki](https://wiki.openwms.cloud/projects/core-preferences-service)**.

# Dependencies
The service is basically a composition of custom libraries. Compared to the opensource version, the ENTERPRISE version contains additional
endpoints for the user interface.

![mavendeps](./src/site/resources/images/maven-deps.drawio.png)
