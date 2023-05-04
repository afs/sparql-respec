#!/bin/bash

DOCDIR="FPWD"
GIT="$HOME/W3C/rdf-star-wg"

function proc() {
    local DOC="$1"
    local SPEC="${DOC/12/}"
    ## WG github repo source
    local SRC="$DOCDIR/$SPEC"
    local SPECDIR="$GIT/$SPEC"
    local DST="$SPECDIR/publication-snapshots/FPWD"
    echo "== $DOC"

    cp -R "$SRC"/* "$DST"

}
    
# With 12
## (cd rdf-star-wg ; rm -rf sparql-*/publication-snapshots/FPWD/* )

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

