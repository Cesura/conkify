#!/usr/bin/env bash

if [ ! -d "$HOME/.conky/art/" ]; then
    mkdir -p "$HOME/.conky/art/"
fi

cd "$HOME/.conky/art/"
image_url=$(../sp art)
image_id=$(echo "$image_url" | cut -d'/' -f5)

if [ ! -f "$image_id"  ] || [ ! -f "../latest.jpg" ] ; then
    rm -f $HOME/.conky/art/*
    wget --quiet "$image_url"
    cp "$image_id" "../latest.jpg"
fi