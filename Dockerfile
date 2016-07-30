FROM ubuntu:latest
MAINTAINER John Lin <knives1003@gmail.com>

RUN apt-get update
RUN apt-get install -y curl unzip libssl-dev python-pip python-dev gcc  phantomjs libnss3-dev 
#
#Install Google chromium
RUN apt-get install -y 
RUN apt-get install -y chromium-browser xvfb 



# Install selenium2 Chrome Driver
RUN curl -o chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip 
RUN unzip chromedriver_linux64.zip -d .
RUN chmod +x ./chromedriver
RUN mv -f ./chromedriver /usr/local/share/chromedriver

#  Change the directory to /usr/bin/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
RUN pip install --upgrade setuptools
RUN pip install --upgrade pip
RUN pip install robotframework 
RUN pip install pycrypto
RUN pip install robotframework-sshlibrary 
RUN pip install robotframework-selenium2library

#Init Xvfb -- 這裡是雷
#RUN export DISPLAY=:1.0
#RUN Xvfb :1 -screen 0 1024x768x16 &> xvfb.log

#Install Chinese font
RUN apt-get install fonts-wqy-zenhei

RUN mkdir /testing
#ADD ./testing /testing
ENV DISPLAY=:1.0
ENV ROBOT_TESTS=/testing/
WORKDIR /testing
COPY ./testing /testing
COPY entry_point.sh /testing/entry_point.sh


ENTRYPOINT ["/testing/entry_point.sh"]

#CMD  [ "bash", "-c", "Xvfb :1 -screen 0 1024x768x16 & > xvfb.log; robot --outputdir  /testing/results /testing/" ]
