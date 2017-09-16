FROM docker.io/mitchty/alpine-ghc

LABEL MAINTAINER "Michael Bright <dockerfiles@mjbright.net>" \
      PackageUrl "http://hackage.haskell.org/package/tart"

# Update Haskell Packages:
RUN cabal update

# Pull and build Tart sources:
RUN git clone https://github.com/jtdaugherty/tart.git
RUN cd tart
RUN cabal new-build

# Set Entrypoint:
RUN $(find . -name tart -type f)
