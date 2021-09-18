#!/usr/bin/env bash
set -euo pipefail

ARGPARSE_ALLOW_UNKNOWN_ARGS=true # tell argparse to allow unknown args
source scripts/argparse.bash
argparse "$@" <<EOF || exit 1
parser.add_argument('environment', choices=['staging', 'production'], help='The environment to point the build to.')
EOF

export PATH=$PATH:$PWD

echo "Running yourProyectName for android, env=$ENVIRONMENT"

if [[ $ENVIRONMENT  == "production" ]]; then
    cp envs/.env.production ./.env
fi

if [[ $ENVIRONMENT  == "staging" ]]; then
    cp envs/.env.staging ./.env
fi

npx jetify
cd android
./gradlew clean
./gradlew bundleRelease

osascript -e 'display notification "yourProyectName bundleRelease generated" sound name "Submarine"'
