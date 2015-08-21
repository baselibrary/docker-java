# baselibrary/java [![Docker Repository on Quay.io](https://quay.io/repository/baselibrary/java/status "Docker Repository on Quay.io")](https://quay.io/repository/baselibrary/java)

[![](http://dockeri.co/image/baselibrary/java)](https://registry.hub.docker.com/u/baselibrary/java/)

## Installation and Usage

    docker pull quay.io/baselibrary/java:${VERSION:-latest}

## Available Versions (Tags)

* `latest`: java 6
* `6`: java 6
* `7`: java 7
* `8`: java 8

## Deployment

To push the Docker image to Quay, run the following command:

    make release

## Continuous Integration

Images are built and pushed to Docker Hub on every deploy. Because Quay currently only supports build triggers where the Docker tag name exactly matches a GitHub branch/tag name, we must run the following script to synchronize all our remote branches after a merge to master:

    make sync-branches
