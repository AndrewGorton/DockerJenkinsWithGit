# Jenkins with Git pre-installed

Based upon the official [Jenkins](https://registry.hub.docker.com/_/jenkins/) image, this simply adds the scm-api and git-client plugins.

## Configuring

The base image specifies that you can create a plugins.txt and use that, but the Docker Hub's automated build didn't appear to be downloading all the plugins.

So the answer is to ADD the plugins directly to /usr/share/jenkins/ref/plugins directory, making sure they've got the right permissions for Jenkins.

To help you with this, the build_dockerfile.sh file creates a Dockerfile based upon plugins.txt, ADDing each additional plugin manually.

## Building

Edit plugins.txt

```txt
# Comments are ignored, as are empty lines
#<plugin_name>:<version>
ansicolor:latest
```

Now create the Dockerfile

```bash
./build_dockerfile.sh
```


## Running

```bash
docker pull andrewgortonuk/dockerjenkinswithgit:1.0
docker run -p 8080:8080 andrewgortonuk/dockerjenkinswithgit:1.0
```
