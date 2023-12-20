#!/usr/bin/env bash

set -eou pipefail

L=$(echo "$LANDSCAPE" | tr '[:upper:]' '[:lower:]')
C=$(echo "$CLUSTER" | tr '[:upper:]' '[:lower:]')

name="${L}-${C}"

# wait for virtual cluster to be ready
echo "⌛️ Waiting for cluster '$name' to be ready..."
kubectl --context "${name}" -n pichu wait --for=jsonpath=.status.readyReplicas=1 --timeout=300s deployment "${L}-pichu-iodine"
kubectl --context "${name}" -n pikachu wait --for=jsonpath=.status.readyReplicas=1 --timeout=300s deployment "${L}-pikachu-iodine"
kubectl --context "${name}" -n raichu wait --for=jsonpath=.status.readyReplicas=1 --timeout=300s deployment "${L}-raichu-iodine"

echo "✅ Virtual clusters are ready!"

pichu_kube=$(kubectl get secrets --context "${name}" -n pichu "vc-${L}-pichu-iodine" -o jsonpath='{.data.config}' | base64 -d)
pikachu_kube=$(kubectl get secrets --context "${name}" -n pikachu "vc-${L}-pikachu-iodine" -o jsonpath='{.data.config}' | base64 -d)
raichu_kube=$(kubectl get secrets --context "${name}" -n raichu "vc-${L}-raichu-iodine" -o jsonpath='{.data.config}' | base64 -d)

echo "📝 Writing to '$HOME/.kube/k3dconfigs/pichu-${C}'"
echo "${pichu_kube}" >"$HOME/.kube/k3dconfigs/pichu-${C}"
echo "📝 Writing to '$HOME/.kube/k3dconfigs/pikachu-${C}'"
echo "${pikachu_kube}" >"$HOME/.kube/k3dconfigs/pikachu-${C}"
echo "📝 Writing to '$HOME/.kube/k3dconfigs/raichu-${C}'"
echo "${raichu_kube}" >"$HOME/.kube/k3dconfigs/raichu-${C}"

echo "🛠️ Attempting to merge kubeconfig cluster '$name'..."
KUBECONFIG=$(cd ~/.kube/configs && find "$(pwd)"/* | awk 'ORS=":"')$(cd ~/.kube/k3dconfigs && find "$(pwd)"/* | awk 'ORS=":"') kubectl config view --flatten >~/.kube/config
chmod 600 ~/.kube/config
echo "✅ Config is merged!"
