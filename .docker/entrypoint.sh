#!/bin/bash
set -e

# ---------------------------------------------------------------------------
# Resolve gems against a COPY of the Gemfile kept outside the mounted repo.
# Bundler always writes its lockfile next to the Gemfile it uses, so this
# keeps the repo's Gemfile.lock (used by GitHub Actions, Ruby 3.1) untouched
# while the container (Ruby 3.3) uses whatever versions it can install.
# ---------------------------------------------------------------------------
mkdir -p /tmp/bundle
cp Gemfile /tmp/bundle/Gemfile
export BUNDLE_GEMFILE=/tmp/bundle/Gemfile
bundle install --quiet

# run cite process once at startup (builds _data/citations.yaml)
python3 _cite/cite.py || echo "cite.py failed (offline?) - continuing with existing citations.yaml"

# run jekyll serve in hot-reload mode
# rerun whenever _config.yaml changes (jekyll hot-reload doesn't work with this file)
watchmedo auto-restart \
    --debug-force-polling \
    --patterns="_config.yaml" \
    --signal SIGTERM \
    -- bundle exec jekyll serve --force_polling --livereload --trace --host=0.0.0.0 --port=4000 \
    | sed "s/LiveReload address.*//g;s/0.0.0.0/localhost/g" &

# rerun cite process whenever citation source files change
watchmedo shell-command \
    --debug-force-polling \
    --recursive \
    --wait \
    --command="python3 _cite/cite.py" \
    --patterns="_data/sources*;_data/orcid*;_data/pubmed*;_data/google-scholar*" \
    _data
