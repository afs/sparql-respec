#!/bin/bash

PUBDIR="Publish"

## Find dated HTML file(s) in local directory
function findfile {
    local DOC="$1"
    local FPWD="FPWD-$DOC"
    local X="$(find . -maxdepth 1 -name "${FPWD}"\*)"
    echo $X
}

function publish() {
    local DOC="$1"
    # Filename with .html
    local FILE="$2"
    local NAME="${FILE%%.html}"

    ## Destination : setup by dirs.sh
    local DIR="$PUBDIR/$DOC"
    
    local URL="https://afs.github.io/sparql-respec/$PUBDIR/${DOC}/${FILE}"

##     if [ ! -e "$DIR" ]
##     then
## 	echo "No such directory: $DIR"
## 	exit 1
##     fi
##     
##     ## Copy HTML file.
##     cp "$FILE" "$DIR"
##     
##     echo
##     echo "* [${NAME}](${DIR}/${FILE})"
##     echo "  * [$DOC PubRules](https://www.w3.org/pubrules/?url=${URL}&profile=FPWD&validation=simple-validation&informativeO=false&echidnaReady=false&patentPolicy=pp2020)"
##     echo "  * [$DOC Link check](https://validator.w3.org/checklink?uri=${URL}&recursive=on)"
    
    local SPEC="${DOC/12/}"
    local FN=FPWD/$SPEC/Overview.html
    URL="https://afs.github.io/sparql-respec/$FN"
    
    echo "* [$FN]($FN)"
    echo "  * [$DOC PubRules](https://www.w3.org/pubrules/?url=${URL}&profile=FPWD&validation=simple-validation&informativeO=false&echidnaReady=false&patentPolicy=pp2020)"
    echo "  * [$DOC LinkCheck](https://validator.w3.org/checklink?uri=${URL}&recursive=on)"
    
}
    

function func {
    local DOC="$1"
    echo "== $DOC" 1>&2
    local FILES="$(findfile "$DOC")"
    local N=0

    for F in $FILES
    do
	if [ -n "$F" ]
	then
	    N="$((N+1))"
	fi
    done

    if [ $N -eq 0 ]
    then
	echo "No file : $DOC"
	return
    fi

    for F in $FILES
    do
	if [ -n "$F" ]
	then
	    F="${F##./}"
	    publish "$DOC" "$F"
	fi
    done
}    

(
    echo "---"
    echo "layout: null"
    echo "title: Drafts"
    echo "---"
    echo

    echo "## SPARQL files"
    # Includes 12

    func  sparql12-query
    func  sparql12-update
    echo

    func  sparql12-results-json
    func  sparql12-results-csv-tsv
    func  sparql12-results-xml
    echo

    func  sparql12-protocol
    func  sparql12-graph-store-protocol
    echo

    func  sparql12-federated-query
    func  sparql12-service-description

    ## echo
    ## func  sparql12-entailment
    ## func  sparql12-new
    ## func  sparql12-concepts

) > map2.md


## https://www.w3.org/pubrules/?url=https%3A%2F%2Fafs.github.io%2Fsparql-respec%2FFPWD-sparql12-query-20230416.html&profile=FPWD&validation=simple-validation&informativeOnly=false&echidnaReady=false&patentPolicy=pp2020

