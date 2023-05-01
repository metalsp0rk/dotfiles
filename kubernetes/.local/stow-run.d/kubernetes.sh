#!/usr/bin/env bash

brew install kubernetes-cli krew kubectx k9s kubeseal helm helmfile

echo "Installing krew plugins..."
kubectl krew install ctx
kubectl krew install ns

