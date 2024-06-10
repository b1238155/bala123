# Use the official Jenkins image as base
FROM jenkins/jenkins:lts

# Switch to root user to install additional packages
USER root

# Install Python 3, Git, and virtualenv
RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install virtualenv

# Switch back to the Jenkins user
USER jenkins

# Install Jenkins plugins (if needed)

# Define default command
CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
