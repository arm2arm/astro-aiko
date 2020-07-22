FROM python:3.7-buster
USER root 
#RUN apt update &&\
#    apt  install -q -y nfs-common
#Upgrade pip
RUN pip install --upgrade pip
# copy over and install packages
COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt


ARG UNAME=stuser
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
RUN mkdir -p  /home/${UNAME}
RUN chown -R ${UID}:${GID} /home/${UNAME}
USER ${UID}:${GID}
WORKDIR /home/${UNAME}

# streamlit-specific commands
RUN mkdir -p /home/${UNAME}/.streamlit
RUN bash -c 'echo -e "\
[general]\n\
email = \"\"\n\
" > /home/stuser/.streamlit/credentials.toml'
RUN bash -c 'echo -e "\
[server]\n\
enableCORS = true\n\
" > /home/stuser/.streamlit/config.toml'

# exposing default port for streamlit
EXPOSE  8501


# run app
CMD streamlit hello 

