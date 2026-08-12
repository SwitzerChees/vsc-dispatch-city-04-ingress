#!/usr/bin/env sh
set -eu

SOURCE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
TARGET_DIR=${1:-.}

if [ ! -f "$TARGET_DIR/deploy/base/kustomization.yaml" ]; then
  echo "Im Ziel fehlt deploy/base/kustomization.yaml. Fuehren Sie das Skript im Projektstand aus Block 3 aus." >&2
  exit 1
fi

mkdir -p "$TARGET_DIR/deploy/overlays/block-04-ingress"
mkdir -p "$TARGET_DIR/apps/dashboard/server/routes"

cp -R "$SOURCE_DIR/deploy/overlays/block-04-ingress/." "$TARGET_DIR/deploy/overlays/block-04-ingress/"
cp "$SOURCE_DIR/apps/dashboard/server/routes/ui-instance.get.ts" "$TARGET_DIR/apps/dashboard/server/routes/"

if [ -f "$TARGET_DIR/apps/dashboard/pages/index.vue" ] && [ ! -f "$TARGET_DIR/apps/dashboard/pages/index.block-03.vue" ]; then
  cp "$TARGET_DIR/apps/dashboard/pages/index.vue" "$TARGET_DIR/apps/dashboard/pages/index.block-03.vue"
fi
cp "$SOURCE_DIR/apps/dashboard/pages/index.vue" "$TARGET_DIR/apps/dashboard/pages/index.vue"

printf 'Block 4 wurde in %s installiert.\n' "$TARGET_DIR"
printf 'Naechster Schritt: Dashboard-Image bauen und in den Cluster teko-k8s importieren.\n'
