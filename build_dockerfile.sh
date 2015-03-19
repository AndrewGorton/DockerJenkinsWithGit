#!/bin/bash

cat << EOF > Dockerfile
FROM jenkins
MAINTAINER Andrew Gorton (http://andrewgorton.uk)
RUN mkdir -p /usr/share/jenkins/ref/plugins
EOF

mkdir -p plugins
while read spec; do
    plugin=(${spec//:/ });
    [[ ${plugin[0]} =~ ^# ]] && continue
    [[ ${plugin[0]} =~ ^\s*$ ]] && continue

    echo ADD https://updates.jenkins-ci.org/download/plugins/${plugin[0]}/${plugin[1]}/${plugin[0]}.hpi /usr/share/jenkins/ref/plugins/${plugin[0]}.hpi >> Dockerfile
done < plugins.txt

echo USER root >> Dockerfile
echo RUN chown -R jenkins /usr/share/jenkins/ref/plugins >> Dockerfile
