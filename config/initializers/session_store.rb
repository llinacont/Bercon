# Be sure to restart your server when you modify this file.

Bercon::Application.config.session_store :cookie_store, key: '_bercon_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Bercon::Application.config.session_store :active_record_store
Bercon::Application.config.secret_token = '7915a955d9da8712308946bef962ea463ad7266df4e96fc04bc97eac0ec35ebacea239a22b44007a5b562f22709f89561911632f2e6d1a5d75eed50297847f9b'
