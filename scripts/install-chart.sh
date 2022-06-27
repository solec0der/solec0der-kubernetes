#!/bin/sh

CHART_PATH=$1
RELEASE_NAME=$2
NAMESPACE=$3
TIMEOUT=$4

echo "Updating dependencies of chart $CHART_PATH"
helm dep build "$CHART_PATH"
echo "Installing chart $CHART_PATH to namespace $NAMESPACE with release name $RELEASE_NAME"
time helm install "$RELEASE_NAME" "$CHART_PATH" \
    --namespace "$NAMESPACE" \
    --timeout "$TIMEOUT"s \
    --create-namespace \
    --wait