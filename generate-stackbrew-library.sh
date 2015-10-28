#!/bin/bash
set -e

declare -A aliases
aliases=(
	[8]='1.8 latest'
	[7]='1.7'
	[6]='1.6'
)

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git@github.com:baselibrary/docker-java.git'

for version in "${versions[@]}"; do
  commit="$(cd "$version" && git log -1 --format='format:%H' -- Dockerfile $(awk 'toupper($1) == "COPY" { for (i = 2; i < NF; i++) { print $i } }' Dockerfile))"
  fullVersion="$(grep -m1 'ENV ELASTICSEARCH_VERSION' "$version/Dockerfile" | cut -d' ' -f3)"

  versionAliases=()
	while [ "$fullVersion" != "$version" -a "${fullVersion%[.-]*}" != "$fullVersion" ]; do
		versionAliases+=( $fullVersion )
		fullVersion="${fullVersion%[.-]*}"
	done
	versionAliases+=( $version ${aliases[$version]} )

  echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done

done