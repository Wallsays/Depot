module OrdersHelper

  # This creates a hash from the PAYMENT_TYPES array. The same should work if you have stored the payment types in the database. This hash is then passed as an option to the options_for_select method.
  def payment_type_options
    options_for_select(Hash[ Order::PAYMENT_TYPES.map { |x| [ 
        I18n.t('orders.payment_types.' + x.parameterize.underscore), x 
        ] } 
    ])    
  end

end
  