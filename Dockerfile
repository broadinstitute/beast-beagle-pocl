FROM ubuntu:22.04

LABEL maintainer "Daniel Park <dpark@broadinstitute.org>"
LABEL maintainer_other "Christopher Tomkins-Tinch <tomkinsc@broadinstitute.org>"

COPY install-*.sh /opt/docker/

# System packages
RUN /opt/docker/install-apt_packages.sh

# Set default locale to en_US.UTF-8
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"
ENV LD_LIBRARY_PATH /usr/local/lib:${LD_LIBRARY_PATH}

RUN /opt/docker/install-beagle.sh

RUN /opt/docker/install-beast.sh

ENV BEAST="/usr/local"

CMD ["/bin/bash"]
