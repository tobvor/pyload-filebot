FROM writl/pyload

MAINTAINER Tobias Vornholt "t.vornholt@mailbox.org"

# download last free filebot version (before license terms have changed)
RUN curl -L -O https://downloads.sourceforge.net/project/filebot/filebot/FileBot_4.7.9/filebot_4.7.9_amd64.deb

# verify checksum and install filebot 
RUN set -e; \
    echo "892723dcec8fe5385ec6665db9960e7c1a88e459a60525c02afb7f1195a50523 filebot_4.7.9_amd64.deb" > filebot_4.7.9_amd64.deb.sum; \
    sha256sum -c filebot_4.7.9_amd64.deb.sum | grep OK; \
    dpkg -i filebot_4.7.9_amd64.deb; \
    \
    rm -rf /tmp/filebot_4.7.9_amd64.deb*
