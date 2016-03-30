Production
==========

:warning: This section is under development.

### Migrate production data sets

- Do not export the schema (experimental: use `yii db/x-dump-data`)
- Don't export the data of tables such as
 - log
 - migration
 - language
 - auth
- Use correct time in migration history
- minimize the number of `dev-master` packages
