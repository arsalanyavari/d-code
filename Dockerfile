FROM ubuntu:22.04

RUN apt-get update && apt-get -y install xauth \
&& apt-get -y install software-properties-common apt-transport-https wget

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - \
&& add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
&& apt-get -y install code

RUN touch /root/.Xauthority

RUN for i in `ls ~/.*rc`; \
do echo "alias code='code --no-sandbox --user-data-dir=/home'" >> $i; done

# NOTE #  Enable below line if you dont use docker-compose
#ENV DISPLAY ":0"


# RUN apt-get -y install cron \
# && echo "* * * * * if ! [[ `xauth list` ]]; then xauth add \$XAUTH; fi" > /etc/cron.d/xauth-cron \
# && chmod 0644 /etc/cron.d/xauth-cron \
# && crontab /etc/cron.d/xauth-cron
# CMD xauth add $XAUTH && while true; do true; done
