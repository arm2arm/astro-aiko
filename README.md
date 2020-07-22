# astro-aiko
Docker base image for Astro data analysis and interactive plots deployements.
Main goal to simplyfy the streamlit(https://www.streamlit.io/) projects deployemnts on OKD/Openshift.
The image contains several python libraries: astropy, pyvo and more.

 

# build image

```
git clone  git@github.com:arm2arm/astro-aiko.git
docker login --username=arm2arm --password=XXXX
docker build -t arm2arm/astro-aiko:latest .
docker push arm2arm/astro-aiko:latest
```
# Images history
```
https://hub.docker.com/r/arm2arm/astro-aiko
```
