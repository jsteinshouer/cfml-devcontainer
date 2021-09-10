# cfml-devcontainer
FROM ortussolutions/commandbox:jdk11-3.4.1 as cfml-devcontainer

RUN apt update \
    && apt install -y curl  \
    && apt install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

RUN box config set verboseErrors=true \
    && box config set server.defaults.trayEnable=false \
    && box config set server.defaults.openBrowser=false \
    && box install commandbox-codechecker \
    && box install commandbox-cflint \
    && box install commandbox-cfformat \
    && box install commandbox-dotenv \
    && box install commandbox-cfconfig \
    && box install commandbox-docbox \
    && box artifacts clean --force

# Install node and Vue CLI into the container
FROM cfml-devcontainer as with-node

ENV NODE_VERSION=14.17.6
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash 
RUN bash -lc "npm config set user 0 && npm config set unsafe-perm true && npm install -g @vue/cli  @vue/cli-service-global && npm cache clean --force"