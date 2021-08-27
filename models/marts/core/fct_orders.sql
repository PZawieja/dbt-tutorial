with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}
),


final as (

    select
        order_id,
        customer_id,
        sum(coalesce(case when payments.status = 'success' then amount end,0)) as amount
    from orders
        left join payments using (order_id)
        left join customers using (customer_id)

    group by order_id, customer_id
    order by order_id, customer_id

)
select * from final