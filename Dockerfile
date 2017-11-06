
# nginx-centos7
# Here you can use whatever base image is relevant for your application.
FROM debian:latest

# Here you can specify the maintainer for the image that you're building
MAINTAINER zuoxiaofeng <zuoxiaofeng.hotmail.com>

# Export an environment variable that provides information about the application version.
# Replace this with the version for your application.
ENV GOLANG_VERSION=1.9.2

# Set the labels that are used for OpenShift to describe the builder image.
LABEL io.k8s.description="Golang Webserver" \
    io.k8s.display-name="Golang 1.9.2" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder,webserver,html,golang" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# Copy the S2I scripts to /usr/libexec/s2i since we set the label that way
RUN mkdir /usr/share/goserver
RUN chown -R 1001:1001 /usr/share/goserver
COPY ./s2i/bin/ /usr/libexec/s2i

USER 1001

# Set the default port for applications built using this image
EXPOSE 8080

# Modify the usage script in your application dir to inform the user how to run
# this image.
CMD ["/usr/libexec/s2i/usage"]
