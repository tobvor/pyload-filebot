FROM writl/pyload:latest
MAINTAINER Tobias Vornholt "t.vornholt@mailbox.org"

# apt-https support
RUN apt-get update && apt-get install -y apt-transport-https

# add filebot apt-key and apt-repository 
RUN curl -fsSL "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub" | apt-key add "-" \
    && echo "deb [arch=amd64] https://get.filebot.net/deb/ stable main" > /etc/apt/sources.list.d/filebot.list

# install filebot and dependencies
RUN apt-get update \
    && apt-get install -y filebot \
    && apt-get purge -y apt-transport-https \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
