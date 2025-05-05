FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget gnupg2 software-properties-common \
    libasound2 libgbm-dev libnss3 libxss1 libgtk-3-0 \
    x11-utils bash ca-certificates \
    libx11-xcb1 libatk-bridge2.0-0 libatk1.0-0 \
    libcups2 libdbus-1-3 libxcomposite1 libxdamage1 libxrandr2 \
    xdg-utils --no-install-recommends

RUN wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_122.0.2365.92-1_amd64.deb && \
    apt install -y ./microsoft-edge-stable_122.0.2365.92-1_amd64.deb && \
    rm *.deb

COPY edge-entry.sh /usr/local/bin/edge-entry.sh
RUN chmod +x /usr/local/bin/edge-entry.sh

CMD ["/usr/local/bin/edge-entry.sh"]
