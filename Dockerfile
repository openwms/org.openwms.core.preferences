FROM bellsoft/liberica-openjre-alpine:25-cds AS builder
LABEL maintainer="interface21.io <product@openwms.org>"
ENV LANG=en_GB.UTF-8
WORKDIR application
ARG JAR_FILE=target/openwms-core-preferences-exec.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=tools -jar application.jar extract --layers --launcher --destination extracted

FROM bellsoft/liberica-openjre-alpine:25-cds
WORKDIR application
COPY --from=builder application/extracted/dependencies/ ./
COPY --from=builder application/extracted/spring-boot-loader/ ./
COPY --from=builder application/extracted/snapshot-dependencies/ ./
COPY --from=builder application/extracted/application/ ./
ENTRYPOINT exec java org.springframework.boot.loader.launch.JarLauncher
