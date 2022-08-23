@items = [
  { id: 1, food_name: 'apple', cost: 1.00 },
  { id: 2, food_name: 'potato', cost: 2.75 },
  { id: 3, food_name: 'jerky', cost: 5.00 },
  { id: 4, food_name: 'popsicles', cost: 4.75 },
  { id: 5, food_name: 'flan', cost: 2.99 }
]
@cart = []
def menu
  puts 'Grocery Store'
  puts '1) View Available Food Items'
  puts '2) Add to Cart'
  puts '3) View Cart'
  puts '4) Remove Item from Cart'
  puts '5) Proceed to Checkout'
  puts 'What do you want to do?'
  menu_choice = gets.strip.to_i
  if menu_choice == 1
    view_items
  elsif menu_choice == 2
    addto_cart
  elsif menu_choice == 3
    view_cart
  elsif menu_choice == 4
    remove_item
  elsif menu_choice == 5
    proceed_to_checkout
  else
    puts 'error, you need to do 1, 2, 3, 4, 5'
  end
  menu
end

def view_items
  puts 'Viewing Available Food Items'
  $count = 1
  @items.each do |item|
    puts "#{$count}) Your food item is #{item[:food_name]} And your cost is $#{item[:cost]}"
    $count += 1
  end
  menu
end

def addto_cart
  puts 'What is your food name?'
  user_input = gets.strip
  @items.each do |item|
    next unless item[:food_name] == user_input

    @cart << item
    puts 'Your item has been added to cart!'
    puts 'is there anything else you would like to add to your cart? Y/N'
    user_input = gets.strip
    if user_input == 'Y' || user_input == 'y'
      addto_cart
    else
      menu
    end
    return
  end
  puts 'Your item is not in this grocery!'
  #   @cart << basket
end

def view_cart
  puts 'Viewing Cart'
  @cart.each do |item|
    puts "Your food item is #{item[:food_name]} And your cost is $#{item[:cost]}"
  end
end

def remove_item
  view_cart
  puts 'Which item would you like to remove?'
  user_input = gets.strip
  @cart.each do |item|
    if item[:food_name] == user_input
      @cart.delete item
      view_cart
    end
  end
end

def proceed_to_checkout
  $total = 0
  @cart.each do |item|
    $total += item[:cost]
  end
  puts 'Your Total is: $' + $total.to_s
end
menu
