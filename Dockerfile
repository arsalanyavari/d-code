FROM ubuntu:22.04

RUN apt-get update && apt-get -y install xauth \
&& apt-get -y install software-properties-common apt-transport-https wget

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - \
&& add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
&& apt-get -y install code

ENV DISPLAY ":0"

RUN touch /root/.Xauthority

RUN for i in `ls ~/.*rc`; \
do echo "alias code='code --no-sandbox --user-data-dir=/home'" >> $i; done

