#!/bin/bash

WG="$HOME/W3C/rdf-star-wg"

PUBDIR="Publish"


## Create directory and copy all files used except index.html.
## Does not clear out deleted files.

function proc {
    local DOC="$1"
    ## WG github repo source
    local SPECDIR="${DOC/12/}"

    # Directory to publish in.
    local DIR="$PUBDIR/$DOC"

    ## rm -rf "$DIR"
    
    mkdir -p "$DIR"
    
    echo "== $SPECDIR"
    FILES="$(find "$WG/$SPECDIR/spec" -maxdepth 1 -type f ! -name index.html)"
    for F in $FILES
    do
	cp "$F" "$DIR"
    done
}
    
# With 12
proc sparql12-query
proc sparql12-update
proc sparql12-results-json
proc sparql12-results-csv-tsv
proc sparql12-results-xml
proc sparql12-protocol
proc sparql12-graph-store-protocol
proc sparql12-federated-query
proc sparql12-service-description

## proc sparql12-entailment
## proc sparql12-new
## proc sparql12-concepts

