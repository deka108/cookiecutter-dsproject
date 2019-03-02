#!/usr/bin/env bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

replace_dotenvfile(){
    sed -ie "s@PROJECT_HOME=.*@PROJECT_HOME=$(pwd)@" "${1}"
    sed -ie "s@PROJECT_CONFIG=.*@PROJECT_CONFIG=${CURRENT_DIR}/config/config.yaml@" .env 
    rm "${1}e"
}

generate_notebooks() {
    mkdir -p notebooks
    touch "notebooks/1) Notebook.ipynb"
}

# Replace .env
cp .env-template .env
replace_dotenvfile ".env"

# Generate Jupyter notebooks
install_jupyter={{ cookiecutter.install_jupyter }}
if [[ ${install_jupyter} =~ notebook|jupyter ]]; then
    echo "Creating notebooks folder for exploratory works..."
    generate_notebooks
fi

# Create dirs
mkdir -p tmp