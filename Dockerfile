FROM apsl/circusbase:latest

MAINTAINER  APSL <bcabezas@apsl.net>

#ssh
ADD conf/jenkinslave.pub /root/.ssh/authorized_keys
RUN \
    apt-get install openssh-server && apt-get clean ;\
    mkdir /var/run/sshd ;\
    chmod 0755 /var/run/sshd ;\
    chmod 700 /root/.ssh ;\
    chmod 600 /root/.ssh/authorized_keys
#ADD conf/pam-sshd /etc/pam.d/sshd
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
ADD setup.d/config-ssh /etc/setup.d/10-config-ssh
ADD circus.d/sshd.ini /etc/circus.d/
# end ssh

RUN apt-get install -q -y --no-install-recommends openjdk-7-jre-headless && apt-get clean
RUN adduser --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd

EXPOSE 22
CMD /bin/start.sh
