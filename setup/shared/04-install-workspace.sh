#!/bin/bash

if [ ! -d $HOME/kong ]; then
    echo "🚀 creating workspaces."
    mkdir -p $HOME/kong/projects
    mkdir -p $HOME/kong/labs
else
    echo "✅ workspaces already exists."
fi

if [ ! -d $HOME/kong/workspaces ]; then
    echo "🚀 installing workspaces."
    git clone https://github.com/kongsakchai/devenvironment.git $HOME/kong/workspaces
else
    echo "✅ workspaces already exists."
fi
