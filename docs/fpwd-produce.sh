#!/bin/bash

PUBDIR="Publish"

function proc() {
    local DOC="$1"
    ## WG github repo source
    local SPECDIR="${DOC/12/}"
    local SRC="$PUBDIR/$DOC"
    local DST="FPWD/${SPECDIR}"
    echo "== $DOC"

    mkdir -p "$DST"
    
    cp -r "$SRC"/* "$DST"

    (cd "$DST"; mv FPWD*html Overview.html)
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

