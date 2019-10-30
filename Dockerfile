FROM debian:10-slim AS build
RUN apt-get update && apt-get install -y build-essential git
COPY . /dsvpn
WORKDIR /dsvpn
RUN make install

FROM debian:10-slim
COPY --from=build /usr/local/sbin/dsvpn /usr/local/sbin/dsvpn
ENTRYPOINT ["/usr/local/sbin/dsvpn"]
