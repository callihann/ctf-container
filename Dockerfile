FROM debian:12

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y apt-utils
RUN apt-get install -y foremost 
RUN apt-get install -y binwalk 
RUN apt-get install -y exiftool 
RUN apt-get install -y outguess 
RUN apt-get install -y pngtools 
RUN apt-get install -y pngcheck 
RUN apt-get install -y stegosuite 
RUN apt-get install -y git
RUN apt-get install -y hexedit 
RUN apt-get install -y python3-pip 
RUN apt-get install -y autotools-dev 
RUN apt-get install -y automake 
RUN apt-get install -y libevent-dev 
RUN apt-get install -y bsdmainutils 
RUN apt-get install -y ffmpeg 
RUN apt-get install -y cewl 
RUN apt-get install -y sonic-visualiser 
RUN apt-get install -y xxd 
RUN apt-get install -y atomicparsley
RUN apt-get install -y forensics-all 
RUN apt install python3-magic
RUN apt install python3-tqdm

COPY install /tmp/install
RUN chmod a+x /tmp/install/*.sh && \
    for i in /tmp/install/*.sh;do echo $i && $i;done && \
    rm -rf /tmp/install

COPY scripts /opt/scripts
RUN find /opt/scripts -name '*.sh' -exec chmod a+x {} + && \
    find /opt/scripts -name '*.py' -exec chmod a+x {} +
ENV PATH="/opt/scripts:${PATH}"

WORKDIR /data