#!/bin/bash

cp .cargo-shortcuts ~/.cargo-shortcuts
echo "source ~/.cargo-shortcuts" >> ~/.bashrc
source ~/.bashrc
