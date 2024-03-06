FROM drupal:10.1-php8.1-apache-bookworm

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
        git;

# Set php memory limit
ARG PHP_MEMORY_LIMIT=1024M
RUN echo "memory_limit = $PHP_MEMORY_LIMIT" >> /usr/local/etc/php/conf.d/memory_limit.ini

# Clean drupal project
WORKDIR /opt
RUN rm -rf /opt/drupal && mkdir /opt/drupal && unlink /var/www/html

ENV OPENY_PROJECT_VERSION 3.2.3
WORKDIR /opt/drupal

RUN set -eux; \
	export COMPOSER_HOME="$(mktemp -d)"; \
	composer create-project --no-interaction "ycloudyusa/yusaopeny-project:$OPENY_PROJECT_VERSION" ./; \
	chown -R www-data:www-data docroot/sites docroot/modules docroot/themes; \
	ln -sf /opt/drupal/docroot /var/www/html; \
	rm -rf "$COMPOSER_HOME"

ENV PATH=${PATH}:/opt/drupal/vendor/bin
