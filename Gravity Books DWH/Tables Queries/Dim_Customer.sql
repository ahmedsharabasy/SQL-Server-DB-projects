
SELECT customer.first_name, customer.last_name, customer.email, address_status.address_status, address.street_number, customer.customer_id, address.address_id, address.street_name, address.city, country.country_name, 
                  country.country_id, address_status.status_id 
FROM     customer left JOIN
                  customer_address ON customer.customer_id = customer_address.customer_id right JOIN
                  address_status ON customer_address.status_id = address_status.status_id right JOIN
                  address ON customer_address.address_id = address.address_id right JOIN
                  country ON address.country_id = country.country_id
