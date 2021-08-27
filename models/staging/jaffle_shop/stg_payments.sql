with payments as (
    
    select 
        orderid AS order_id
        , paymentmethod AS payment_method
        , status
        , amount
        , created
    from raw.stripe.payment
)

select * from payments