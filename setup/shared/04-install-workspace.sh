#!/bin/bash

if [ ! -d ~/kong ]; then
    echo "🚀 creating workspaces."
    mkdir -p ~/kong/projects
    mkdir -p ~/kong/labs
else
    echo "🌱 workspaces already exists."
fi

if [ ! -d ~/kong/workspaces ]; then
    echo "🚀 installing workspaces."
    git clone git@github.com:kongsakchai/devenvironment.git ~/kong/workspaces
else
    echo "🌱 workspaces already exists."
fi
