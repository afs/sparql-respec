#!/bin/bash

function func {
    local DOC="$1"
    local TS="$2"
    local URL="https://afs.github.io/sparql-respec/${DOC}FPWD-${DOC}-${TS}.html"

    
    
    echo
    echo "* [FPWD-$DOC-$TS](FPWD-$DOC-$TS.html)"
    echo "  * [$DOC PubRules](https://www.w3.org/pubrules/?url=${URL}&profile=FPWD&validation=simple-validation&informativeOnly=false&echidnaReady=false&patentPolicy=pp2020)"
    echo "  * [$DOC Link check](https://validator.w3.org/checklink?uri=${URL}&recursive=on)"
}

echo "---"
echo "layout: null"
echo "title: Drafts"
echo "---"
echo

echo "## SPARQL files"

func  sparql12-query            20230416 
func  sparql12-update           20230405
echo

func  sparql12-results-json     20230412
func  sparql12-results-xml      20230407
func  sparql12-results-csv-tsv  20230407
echo

func  sparql12-protocol             20230421
func  sparql12-graph-store-protocol 20230405
echo

func  sparql12-federated-query     20230405
func  sparql12-service-description 20230407


## https://www.w3.org/pubrules/?url=https%3A%2F%2Fafs.github.io%2Fsparql-respec%2FFPWD-sparql12-query-20230416.html&profile=FPWD&validation=simple-validation&informativeOnly=false&echidnaReady=false&patentPolicy=pp2020

