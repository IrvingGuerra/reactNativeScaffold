#!/usr/bin/env bash
set -euo pipefail

function retrieve_password_from_keychain() {
    echo $(security find-generic-password -a $USER -s $1 -w 2>/dev/null)
}

function die() {
    echo -e "\n\033[0;31m$1\033[0m\n"
    exit 1
}
#
# Command choices: build, run - The default is run
# deploy_env choiches: dev, prod - The default is local
#
# Examples:
# scripts/runcordova.sh ios <deploy_env> <build_type> <build> <cordova_flags>
# scripts/runcordova.sh android prod
# scripts/runcordova.sh ios dev
# parser.add_argument('deploy_env', nargs='?', default='local', help='The environment to point the build to.')

ARGPARSE_ALLOW_UNKNOWN_ARGS=true # tell argparse to allow unknown args
source scripts/argparse.bash
argparse "$@" <<EOF || exit 1
parser.add_argument('platform', choices=['android', 'ios'], help='The platform to build for.')
parser.add_argument('environment', choices=['development', 'staging', 'production'],  help='The environment to point the build to.')
parser.add_argument('-s', '--simulator', choices=['SE', '12ProMax', False], default=False, help='The simulator to build for.')
parser.add_argument('-r', '--release', action='store_true', default=False, help='Use release mode. [default %(default)s]')
EOF

export PATH=$PATH:$PWD

echo "Running yourProyectName for $PLATFORM, env=$ENVIRONMENT, release=$RELEASE, simulator=$SIMULATOR"

if [[ $ENVIRONMENT  == "production" ]]; then
    cp envs/.env.production ./.env
fi

if [[ $ENVIRONMENT  == "staging" ]]; then
    cp envs/.env.staging ./.env
fi

if [[ $ENVIRONMENT  == "development" ]]; then
    cp envs/.env.development ./.env
fi

if [[ $ENVIRONMENT  == "storybook" ]]; then
    echo $'\nSTORYBOOK=true' >> ./.env
fi

if [[ $PLATFORM == 'android' ]]; then
    cd android
    ./gradlew clean
    cd -
fi

if [[ $PLATFORM == "android" && $RELEASE ]]; then
    react-native run-$PLATFORM --variant release
    return
fi

if  [[ $RELEASE ]]; then
    react-native run-$PLATFORM --configuration Release
    return
fi

if [[ $PLATFORM == "ios" && $SIMULATOR == "12Mini" ]]; then
    react-native run-$PLATFORM --simulator="iPhone 12 mini"
    exit 0
fi


if [[ $PLATFORM == "ios" && $SIMULATOR == "12" ]]; then
    react-native run-$PLATFORM --simulator="iPhone 12"
    exit 0
fi

if [[ $PLATFORM == "ios" && $SIMULATOR == "12Pro" ]]; then
    react-native run-$PLATFORM --simulator="iPhone 12 Pro"
    exit 0
fi

if [[ $PLATFORM == "ios" && $SIMULATOR == "12ProMax" ]]; then
    react-native run-$PLATFORM --simulator="iPhone 12 Pro Max"
    exit 0
fi

if [[ $PLATFORM == "ios" ]]; then
    react-native run-$PLATFORM --simulator="iPhone SE (2nd generation)"
    exit 0
fi

react-native run-$PLATFORM

osascript -e 'display notification "yourProyectName now running" sound name "Submarine"'
