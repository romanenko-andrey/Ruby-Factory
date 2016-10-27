Factory is Struct
=======================
***
###Example 1:

Customer = Factory.new(:first_name, :address, :zip)

user = Customer.new('Andrey', 'Dnepr-city', 49000)

    user.first_name.to_s        #>="Andrey"
    user['first_name'].to_s     #>="Andrey"
    user[:first_name] .to_s     #>="Andrey"
    user[0].to_s                #>="Andrey"
 
***
###Example 2:

>Customer = Factory.new(:first_name, :address, :zip) do
>>def greeting
>>>"Hello #{first_name}!"

>>end

>end

Customer.new('Bob', 'Dnepr-city', 49000).greeting    => "Hello Bob!"
