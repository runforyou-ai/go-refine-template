ARG TARGETARCH
FROM debian:bookworm-slim
ARG TARGETARCH
RUN apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/log/go-refine-template /etc/go-refine-template
COPY build/go-refine-template-linux-${TARGETARCH} /usr/local/bin/go-refine-template
VOLUME ["/var/log/go-refine-template"]
EXPOSE 3000
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
	CMD curl -fsS http://127.0.0.1:3000/health || exit 1
CMD ["go-refine-template", "serve", "-f", "/etc/go-refine-template/config.yaml", "--pid", "/tmp/go-refine-template.pid"]
