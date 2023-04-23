#!/bin/bash

minikube start --network-plugin=cni --cni=false --driver=dockr
bash ./cilium-cli.sh
brew install helm
helm repo add cilium https://helm.cilium.io/
helm install cilium cilium/cilium --version 1.13.2 \
  --namespace kube-system --values ../cilium-helm-values.yaml
