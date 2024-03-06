FROM base

# Install site
RUN drush \
    -vy si \
    openy \
    openy_configure_profile.preset=standard \
    openy_theme_select.theme=openy_carnation \
    openy_terms_of_use.agree_openy_terms=1 \
    install_configure_form.enable_update_status_emails=NULL \
    --account-name=admin \
    --account-pass=open9622 \
    --site-name='YMCA Website Services sandbox' \
    --db-url=sqlite://sites/default/files/standard.openy_carnation.ht.sqlite

RUN chown -R www-data:www-data docroot/sites docroot/modules docroot/themes;
