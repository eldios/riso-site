# Run `just` with no arguments to see this list.
default:
    @just --list

# Build the site into site/public.
build:
    cd site && nice -n 19 zola build

# Serve the site locally with live reload.
serve:
    cd site && zola serve

# Every check a push must pass: building site, valid workflows.
ci:
    just build
    actionlint -shellcheck '' .github/workflows/*.yml
