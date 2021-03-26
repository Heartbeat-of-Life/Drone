#locale  # check for UTF-8
FROM ubuntu:bionic
RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get install -y tzdata gnupg2 gawk vim mesa-utils sudo wget git  make gcc
#RUN apt-get update &&  apt-get install locales
#RUN locale-gen en_US en_US.UTF-8
#RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
#RUN export LANG=en_US.UTF-8
#RUN locale  # verify settings
#RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  apt-get install -y curl gnupg2 lsb-release
#RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
#RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
#RUN apt-get update
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ros-eloquent-ros-base
#RUN apt-get install -y python3-pip && pip3 install -U argcomplete && apt-get install -y python3-colcon-common-extensions
#RUN sh -c 'echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> /etc/bash.bashrc' # TBT
RUN echo "marker-1"
RUN git clone https://github.com/WiringPi/WiringPi.git /opt/WiringPi
RUN echo "marker0"
RUN cd /opt/WiringPi 
RUN echo "marker1"
RUN echo "$(pwd)"
WORKDIR  /opt/WiringPi 
RUN ./build 
RUN echo "marker2"
ENV PATH=$PATH:/opt/WiringPi/gpio
COPY ros-entrypoint.sh /usr/bin
RUN chmod a+x /usr/bin/ros-entrypoint.sh
ENTRYPOINT ["/usr/bin/ros-entrypoint.sh"]
#
