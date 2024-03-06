ARG YUSAOPENY_PROJECT_VERSION=latest
FROM base:$YUSAOPENY_PROJECT_VERSION

ARG OPENY_CONFIGURE_PROFILE=standard
ARG OPENY_THEME_SELECT=openy_carnation
ARG ACCOUNT_NAME=admin
ARG ACCOUNT_PASS=open9622
ARG SITE_NAME='YMCA Website Services sandbox'

# Install site
RUN set -eux; \
    drush \
        -vy si \
        openy \
        openy_configure_profile.preset=$OPENY_CONFIGURE_PROFILE \
        openy_theme_select.theme=$OPENY_THEME_SELECT \
        openy_terms_of_use.agree_openy_terms=1 \
        install_configure_form.enable_update_status_emails=NULL \
        --account-name=$ACCOUNT_NAME \
        --account-pass=$ACCOUNT_PASS \
        --site-name=$SITE_NAME \
        --db-url=sqlite://sites/default/files/.ht.sqlite; \
    drush -vy cr; \
    chown -R www-data:www-data docroot/sites;
