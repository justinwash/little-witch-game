#!/usr/bin/env sh
# pre-commit.sh

STASH_NAME="pre-commit-$(date +%s)"
BRANCH_NAME=$(git branch | grep '*' | sed 's/* //')
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
BOLD='\033[1m'

# Check if commit is on a rebase, if not proceed as usual
if [ $BRANCH_NAME != '(no branch)' ]
then
    stash=0
    # Check to make sure commit isn't emtpy, exit with status 1 if it is
    if git diff-index --quiet HEAD --; then
        echo "${RED}You've tried to commit an empty commit${NC}"
        echo "\tMake sure to add your changes with 'git add'"
        exit 1
    else
        # Stash all changes in the working directory so we test only commit files
        if git stash save -u -k -q $STASH_NAME; then
            echo "${YELLOW}Stashed changes as:${NC} ${STASH_NAME}\n\n"
            stash=1
        fi
    fi

    echo "${GREEN} Testing commit${NC}\n\n"

    echo "${YELLOW}${BOLD}Cargo Test${NC}\n"
    cargo test --all &&
    cargo doc --no-deps

    cargo_pass=$?

    echo "\n\n${YELLOW}${BOLD}Godot Test${NC}\n"

    cargo build --manifest-path ./test/Cargo.toml &&
    mkdir -p ./test/project/lib &&
    cp ./target/debug/libgdnative_test.so ./test/project/lib/libgdnative_test.so &&
    godot --path ./test/project

    # Capture exit code from tests
    godot_pass=$?

    # Revert stash if changes were stashed to restor working directory files
    if [ "$stash" -eq 1 ]
    then
        if git stash pop -q; then
            echo "\n\n${GREEN}Reverted stash command${NC}"
        else
            echo "\n\n${RED}Unable to revert stash command${NC}"
        fi
    fi
    # Inform user of build failure
    if [ "$cargo_pass" -ne "0" ]
    then
        echo "${RED}Build failed: cargo tests failed ${NC} if you still want to commit use ${BOLD}'--no-verify'${NC}"
    fi

    # Inform user of build failure
    if [ "$godot_pass" -ne "0" ]
    then
        echo "${RED}Build failed, integration tests failed:${NC} if you still want to commit use ${BOLD}'--no-verify'${NC}"
    fi

    # Exit with exit code from tests, so if they fail, prevent commit
    exit "$(($cargo_pass || $godot_pass))"
else
    # Tests were skipped for rebase, inform user and exit zero
    echo "${YELLOW}Skipping tests on branchless commit${NC}"
    exit 0
fi
