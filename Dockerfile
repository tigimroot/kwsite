FROM nginx:alpine

gut url for static site
ARG sitegiturl

RUN apk add --no-cache git; git clone $sitegiturl temp; mv temp/index.html /usr/share/nginx/html/; rm -r temp;

# run nginx in foreground.
CMD ["nginx", "-g", "daemon off;"]

# HOWTO:
# To build this image, run `docker build -t {name} . --build-arg sitegiturl={git repo url}`
