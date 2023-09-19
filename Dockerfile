FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y unzip libaio1

# Download and install Oracle Instant Client
ADD https://download.oracle.com/otn_software/linux/instantclient/199000/instantclient-basic-linux.x64-19.9.0.0.0dbru.zip /tmp/
RUN unzip /tmp/instantclient-basic-linux.x64-19.9.0.0.0dbru.zip -d /usr/local/
RUN ln -s /usr/local/instantclient_19_9 /usr/local/instantclient

# Set environment variables
ENV LD_LIBRARY_PATH=/usr/local/instantclient
ENV ORACLE_HOME=/usr/local/instantclient
ENV PATH=/usr/local/instantclient:$PATH

CMD ["bash"]

