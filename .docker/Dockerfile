# start with official ruby docker image as base
FROM ruby:3.3-slim-bookworm

# set working directory within container
WORKDIR /usr/src/app

# install system dependencies (layer caching: rarely changes)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    libcurl4 \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# copy gemfile first for better layer caching
COPY Gemfile ./

# install ruby gems (use latest bundler, don't use frozen Gemfile.lock)
RUN gem install bundler && \
    bundle install

# copy python requirements
COPY _cite/requirements.txt ./

# install python packages
RUN python3 -m pip install --no-cache-dir --upgrade --break-system-packages --requirement requirements.txt

# install watchdog for file monitoring
RUN pip install --break-system-packages "watchdog[watchmedo]==3.0.0"

# copy app code (layer caching: most frequently changes)
COPY . ./

# ports used by jekyll and livereload
EXPOSE 4000 35729

# make entrypoint executable
RUN chmod +x .docker/entrypoint.sh

# run jekyll and cite process
CMD [ "./.docker/entrypoint.sh" ]
