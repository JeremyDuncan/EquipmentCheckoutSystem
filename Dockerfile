# ==============================================================================
# Use the official Ruby image from Docker Hub
# ------------------------------------------------------------------------------
FROM ruby:3.2.2

# ==============================================================================
# Set environment variables
# ------------------------------------------------------------------------------
# ENV RAILS_ROOT /var/www/EquipmentCheckoutSystem
# ENV RAILS_ENV='production'
# ENV RACK_ENV='production'

ENV RAILS_ROOT /var/www/EquipmentCheckoutSystem
ENV RAILS_ENV='development' 
ENV RACK_ENV='development'  


# ==============================================================================
# Create and set the working directory
# ------------------------------------------------------------------------------
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# ==============================================================================
# Install system dependencies
# ------------------------------------------------------------------------------
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# ==============================================================================
# Copy Gemfile and install gems
# ------------------------------------------------------------------------------
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --without development test

# ==============================================================================
# Copy the main application
# ------------------------------------------------------------------------------
COPY . .

# ==============================================================================
# Precompile assets
# ------------------------------------------------------------------------------
RUN bundle exec rails assets:precompile

# ==============================================================================
# Expose port 8532 to the Docker host
# ------------------------------------------------------------------------------
EXPOSE 8532

# ==============================================================================
# The default command that gets run will start the Puma server
# ------------------------------------------------------------------------------
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
