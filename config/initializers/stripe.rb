Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_2fagZTNYtz2xNp6qOVcR0Y2I'],
  :secret_key      => ENV['sk_test_aCrc2HkKI5sVIPGkdjWxi0NQ']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
