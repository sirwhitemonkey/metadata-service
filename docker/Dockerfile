# java
FROM java:openjdk-8-jdk

MAINTAINER moxion

# ap-get
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get install telnet -y

# execute
CMD ["/service/exec.sh", "start"]

