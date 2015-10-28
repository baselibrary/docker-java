#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )


for version in "${versions[@]}"; do	
  fullVersion="$(curl -fsSL "http://ppa.launchpad.net/webupd8team/java/ubuntu/dists/trusty/main/binary-amd64/Packages.gz" | gunzip | awk -F ': ' '$1 == "Package" { pkg = $2 } pkg == "oracle-java"'"$version"'"-installer" && $1 == "Version" { print $2 }' )"
	(
		set -x
		sed '
			s/%%JAVA_MAJOR%%/'"$version"'/g;
			s/%%JAVA_VERSION%%/'"$fullVersion"'/g;
		' Dockerfile.template > "$version/Dockerfile"
	)
done
