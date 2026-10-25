ARG TARGETARCH
FROM debian:bookworm-slim
ARG TARGETARCH
RUN apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/log/app-template /etc/app-template
COPY build/app-template-linux-${TARGETARCH} /usr/local/bin/app-template
VOLUME ["/var/log/app-template"]
EXPOSE 3000
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
	CMD curl -fsS http://127.0.0.1:3000/health || exit 1
CMD ["app-template", "serve", "-f", "/etc/app-template/config.yaml", "--pid", "/tmp/app-template.pid"]
