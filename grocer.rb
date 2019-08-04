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
coupons.each do |coupon|
    coupon_name = coupon[:item]
    coupon_item_num = coupon[:num]
    cart_item = cart[coupon_name]

     next if cart_item.nil? || cart_item[:count] < coupon_item_num

     cart_item[:count] -= coupon_item_num

     coupon_in_cart = cart["#{coupon_name} W/COUPON"]

     if coupon_in_cart
      coupon_in_cart[:count] += 1
    else
      cart["#{coupon_name} W/COUPON"] = { 
        price: coupon[:cost], 
        clearance: cart_item[:clearance], 
        count: 1
      }
    end
  end

   cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
