FROM --platform=$BUILDPLATFORM bellsoft/liberica-openjre-alpine:25-cds AS builder
LABEL maintainer="interface21.io <product@openwms.org>"
ENV LANG=en_GB.UTF-8
WORKDIR /builder
ARG JAR_FILE=target/openwms-core-preferences-exec.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=tools -jar application.jar extract --layers --destination extracted

FROM bellsoft/liberica-openjre-alpine:25-cds
WORKDIR /application
COPY --from=builder /builder/extracted/dependencies/ ./
COPY --from=builder /builder/extracted/spring-boot-loader/ ./
COPY --from=builder /builder/extracted/snapshot-dependencies/ ./
COPY --from=builder /builder/extracted/application/ ./
# Regenerate the JDK's base CDS archive with the same native-access setting as the runtime
# below, otherwise the JVM reports a mismatch and disables optimized module handling
RUN java --enable-native-access=ALL-UNNAMED -Xshare:dump
# CDS training run: exits on context refresh and writes the archive used at runtime.
# unset: BuildKit injects OTEL_* variables pointing at its build tracer (unix socket),
# which Spring Boot would pick up and fail on during the training run.
RUN unset $(env | cut -d= -f1 | grep ^OTEL_); \
    java --enable-native-access=ALL-UNNAMED -XX:ArchiveClassesAtExit=application.jsa \
    -Dspring.context.exit=onRefresh -Dspring.profiles.active=TEST -jar application.jar
ENTRYPOINT ["java", "--enable-native-access=ALL-UNNAMED", "-XX:SharedArchiveFile=application.jsa", "-jar", "application.jar"]
