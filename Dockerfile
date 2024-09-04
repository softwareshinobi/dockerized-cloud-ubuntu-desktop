FROM dorowu/ubuntu-desktop-lxde-vnc as baseDesktop

##

ARG DEBIAN_FRONTEND=noninteractive

RUN rm /etc/apt/sources.list.d/google-chrome.list

RUN apt update && apt upgrade -y;

