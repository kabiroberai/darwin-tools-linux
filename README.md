# ios-toolchain-linux

A modern iOS toolchain for Linux

## Prerequisites

    sudo apt-get install rename chrpath

## Usage

In order to prepare a toolchain yourself, run the following command after cloning this repo

    ./prepare-toolchain

## Installation

    tar xzf </path/to/toolchain.tar.gz> -C "$THEOS/toolchain"

You can obtain a pre-prepared toolchain from the releases section of this repository.

## Dependencies

To use this toolchain, you must have either clang-6.0, clang-7, or clang-8 installed. For instructions on how to install these, see <http://apt.llvm.org>.
