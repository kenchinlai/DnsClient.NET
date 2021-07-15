#!/bin/bash -e

operation="${1}"

function bail() {
    if [[ $# -eq 0 ]]; then
        echo "${0}: Script called 'bail' without passing a message" 1>&2
    else
        echo "${0}: $@" 1>&2
    fi
    exit 1
}

proj=src/DnsClient/DnsClient.csproj
configuration=Release

if [[ -z "${operation}" ]]; then
    bail "Must supply parameter (restore|build|pack)"
elif [[ "${operation}" == "restore" ]]; then
    dotnet ${operation} ${proj}
elif [[ "${operation}" == "build" ]]; then
    dotnet ${operation} --configuration ${configuration} ${proj}
elif [[ "${operation}" == "pack" ]]; then
    dotnet ${operation} --configuration ${configuration}
else
    bail "Parameter ${operation} not supported"
fi
