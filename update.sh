#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )


for version in "${versions[@]}"; do
	repoPackage="http://ppa.launchpad.net/webupd8team/java/ubuntu/dists/trusty/main/binary-amd64/Packages.gz"
  fullVersion="$(curl -fsSL "${repoPackage}" | gunzip | awk -v pkgname="oracle-java${version}-installer" -F ': ' '$1 == "Package" { pkg = $2 } pkg == pkgname && $1 == "Version" { print $2 }' | sort -rV | head -n1 )"
	(
		set -x
		sed '
			s/%%JAVA_MAJOR%%/'"$version"'/g;
			s/%%JAVA_VERSION%%/'"$fullVersion"'/g;
		' Dockerfile.template > "$version/Dockerfile"
	)
done
