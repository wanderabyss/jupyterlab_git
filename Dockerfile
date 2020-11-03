FROM ubuntu:20.04

ENV TZ=US
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update
RUN apt-get -y install python3-pip
RUN apt-get -y install build-essential libssl-dev libffi-dev python3-dev 
RUN apt-get -y install nodejs npm 
RUN apt-get -y install git

RUN pip3 install --upgrade jupyterlab jupyterlab-git

RUN jupyter lab build

RUN pip3 install pandas seaborn tabulate

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0",  "--allow-root"] 
