    select 
        orderid AS order_id
        , paymentmethod AS payment_method
        , status
        , amount / 100 as amount
        , created
    from raw.stripe.payment
