if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_plasearch-back', domain: Rails.application.credentials.origin[:plasearch_front]
else
  Rails.application.config.session_store :cookie_store, key: '_plasearch-back'
end