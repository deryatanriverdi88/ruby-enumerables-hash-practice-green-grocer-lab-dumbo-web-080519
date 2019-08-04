require "pry"

foods =
[
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]

def consolidate_cart(cart)
  result = {}
  cart.each do |food_list|
    food_list.each do |key, value|
       
      if result.key?(key)
        result[key][:count] += 1
        
        
      else
        result[key] = value
        result[key][:count] = 1
      end
    end
    
  end
  result
 
end

p consolidate_cart(foods)

def apply_coupons(cart,coupons)
result = {}
# code here#
cart.each do |food, info|
  coupons.each do |coupon|
    if food == coupon[:item] && info[:count] >= coupon[:num]
      info[:count] =  info[:count] - coupon[:num]
      if result["#{food} W/COUPON"]
        result["#{food} W/COUPON"][:count] += 1
      else
        result["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
      end
    end
  end
  result[food] = info
end
result
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
