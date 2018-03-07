#!/bin/bash
export PGPASSWORD=test;
R_FILE="psql -U test -d test -w -f"

$R_FILE inmediate2.sql;
