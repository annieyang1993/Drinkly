# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.delete_all

User.delete_all
Restaurant.delete_all
Location.delete_all
Item.delete_all
Tag.delete_all



User.create!(
    first_name: 'Demo',
    last_name: 'User',
    username: 'demouser@gmail.com',
    number: '0000000000',
    password: 'demotest'
)

r10 = Restaurant.create!(
  name: 'Partners Coffee',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7487167,
  longitude: -73.9750118,
  img1: '/Partners1.jpeg',
  img2: '/Partners2.jpeg',
  price_level: 2,
  description: "Delicious coffee place"
)

r1 = Restaurant.create!(
  name: 'Double Dutch Espresso',
  email: 'dd@gmail.com',
  phone: '000-000-0000',
  latitude: 40.8058557,
  longitude: -73.954049,
  img1: '/DoubleDutch1.png',
  img2: '/DoubleDutch2.png',
  price_level: 2,
  description: "One of the best coffee shops in Harlem, with great drinks and kind staff!"
)

r2 = Restaurant.create!(
  name: 'Remi Flower & Coffee',
  email: 'remi@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7536762,
  longitude: -73.9692025,
  img1: '/Remi1.png',
  img2: '/Remi2.png',
  price_level: 2,
  description: "Coffee and flowers? Yes please."
)

r3 = Restaurant.create!(
  name: 'Bibble & Sip',
  email: 'bibble@gmail.com',
  phone: '000-000-0000',
  latitude: 40.762761,
  longitude: -73.9852786,
  img1: '/Bibble1.png',
  img2: '/Bibble2.png',
  price_level: 2,
  description: "One of the best coffee and dessert places in NYC!"
)

r4 = Restaurant.create!(
  name: 'Blue Bottle Coffee',
  email: 'blue@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7575724,
  longitude: -73.9787968,
  img1: '/Blue1.png',
  img2: '/Blue2.png',
  price_level: 2,
  description: "Famous coffee chain originating from Australia!"
)

r5 = Restaurant.create!(
  name: 'Abraco',
  email: 'abraco@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7271928,
  longitude: -73.9862955,
  img1: '/Abraco1.png',
  img2: '/Abraco2.png',
  price_level: 2,
  description: "Incredible espresso and coffee"
)
r6 = Restaurant.create!(
  name: 'Coffee Project NYC',
  email: 'coffee@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7268443,
  longitude: -73.989093,
  img1: '/Project1.png',
  img2: '/Project2.png',
  price_level: 2,
  description: "One of NYC's most-loved coffee shops since 2015."
)
r7 = Restaurant.create!(
  name: 'Citizens of Gramercy',
  email: 'gramercy@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7367246,
  longitude: -73.9817683,
  img1: '/Citizens1.png',
  img2: '/Citizens2.png',
  price_level: 2,
  description: "Delicious coffee place"
)
r8 = Restaurant.create!(
  name: 'Urban Backyard',
  email: 'urban@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7208305,
  longitude: -73.9967116,
  img1: '/Urban1.png',
  img2: '/Urban2.png',
  price_level: 2,
  description: "Environmentally conscious cafe with classic drinks & ornamental cupcakes in a verdant, rustic space. "
)

#############################
r9 = Restaurant.create!(
  name: 'Academy at Coffee Project NY',
  email: 'academy@gmail.com',
  phone: '000-000-0000',
  latitude: 40.7410723,
  longitude: -73.9492874,
  img1: '/Academy1.png',
  img2: '/Academy2.png',
  price_level: 2,
  description: "A spacious coffee shop, roaster, and training lab"
)



############ Items for Partners ####################################
r1i1 = Item.create!(
  item_name: 'Bacon, Egg, & Cheese sandwich',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 10.95,
  section: 'Partners Kitchen',
  item_description: 'Scrambled Eggs, Bacon, Pepperjack Cheese, Jalapeno Mayo, Avocado on a Ciabatta Roll (All our eggs are from the Farmers Hen and have fresh milk from Battenkill Farm) (No substitutions allowed)'
 )

r1i2 = Item.create!(
  item_name: 'Calabro Fresh Ricotta Avocado Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 12.95,
  section: 'Partners Kitchen',
  item_description: 'Fresh Ricotta, Mashed Avocado, Roasted Tomatoes, Basil, All Spice Sea Salt on Sourdough (No substitutions allowed)',
  img: 2
)

r1i3 = Item.create!(
  item_name: 'Chipotle Chicken Salad Bowl',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 12.95,
  section: 'Partners Kitchen',
  item_description: 'Mixed Greens with Avocado, Tomatoes, Cucumbers, Red Onions, Black Beans, Roasted Corn, Roasted Sweet Potatoes, Tossed in a Cilantro Lime Dressing with Chipotle Chicken (No substitutions allowed)',
  img: 3
)

r1i4 = Item.create!(
  item_name: 'Fresh Fruit Salad Cup',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 8.50,
  section: 'Partners Kitchen',
  item_description: 'Strawberries, Blueberries, Grapes, Pineapple with Lime Mint Syrup (Substitutions not allowed)',
  img: 4
)

r1i5 = Item.create!(
  item_name: 'Prosciutto & Fresh Mozzarella Sandwich',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 12.95,
  section: 'Partners Kitchen',
  item_description: 'Prosciutto Di Parma, Mozzarella, Sliced Green Apples, Arugula, Balsamic Vinaigrette on a French Baguette (No substitutions allowed)',
  img: 5
)

r1i6 = Item.create!(
  item_name: 'Roasted Chicken Sandwich',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 12.95,
  section: 'Partners Kitchen',
  item_description: 'Roasted Chicken, Chili Mayo, Pickled Onions, Arugula, Sliced Avocado on a French Baguette (No Substitutions allowed)',
  img: 6
)

r1i7 = Item.create!(
  item_name: 'Scrambled Egg, Prosciutto & Blue Cheese Sandwich',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 13.50,
  section: 'Partners Kitchen',
  item_description: 'Scrambled eggs, blue cheese, crispy rosemary prosciutto with arugula on a ciabatta roll. (No changes allowed - ingredients pre-prepped)',
  img: 7
)

r1i8 = Item.create!(
  item_name: 'Smoked Turkey Salad Bowl',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 12.95,
  section: 'Partners Kitchen',
  item_description: 'Mixed Greens with Avocado, Tomatoes, Cucumbers, Red Onions, Rainbow Carrots, Tossed in Balsamic with Smoked Turkey and Mozzarella (No substitutions allowed)',
  img: 8
)

r1i9 = Item.create!(
  item_name: 'Smoked Turkey Sandwich',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 12.95,
  section: 'Partners Kitchen',
  item_description: 'Sliced Turkey, Spicy Mayo, Provolone, Bacon, Tomatoes, Cucumbers, Red Onions on a French Baguette (No substitutions allowed)',
  img: 9
)

r1i10 = Item.create!(
  item_name: 'Sausage, Egg & Cheese',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 11.25,
  section: 'Partners Kitchen',
  item_description: 'Scrambled eggs, pork sausage, caramelized onions & provolone on a warm ciabatta roll. (No changes allowed - ingredients pre-prepped)',
  img: 10
)

#####################################################################
r1i12 = Item.create!(
  item_name: 'Matcha Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.25,
  section: 'Beverages',
  item_description: '12 oz - organic Matcha blended with hot water',
  img: 11
)

r1i12 = Item.create!(
  item_name: 'Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.95,
  section: 'Beverages',
  item_description: 'Double shot of espresso with textured milk.',
  img: 12
)

r1i12 = Item.create!(
  item_name: 'Iced Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 5.95,
  section: 'Beverages',
  item_description: '16 oz iced latte',
  img: 13
)

r1i12 = Item.create!(
  item_name: 'Drip Coffee',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 3.95, 
  section: 'Beverages',
  item_description: 'Freshly brewed drip.',
  img: 14
)

r1i12 = Item.create!(
  item_name: 'Cappucino',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.75,
  section: 'Beverages',
  item_description: '6 oz - double shot of espresso with textured milk.',
  img: 15
)

r1i12 = Item.create!(
  item_name: 'Hot Chocolate',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 5.75,
  section: 'Beverages',
  item_description: '12 oz - just like your grandma makes it sweet & with love',
  img: 16
)

r1i12 = Item.create!(
  item_name: 'Cold Brew',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.95,
  section: 'Beverages',
  item_description: '16oz - slowly steeped cold brew coffee.',
  img: 17
)

r1i12 = Item.create!(
  item_name: 'Matcha Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 5.75,
  section: 'Beverages',
  item_description: '12 oz - organic Matcha blended with steamed milk.',
  img: 18
)

r1i12 = Item.create!(
  item_name: 'Hot Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.50,
  section: 'Beverages',
  item_description: '16 oz - custom organic blends sourced by our team.',
  img: 19
)

r1i12 = Item.create!(
  item_name: 'Iced Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.75,
  section: 'Beverages',
  item_description: '16 oz - custom-blended Partners breakfast tea.',
  img: 20
)

####################################################################
r1i12 = Item.create!(
  item_name: 'Chocolate Croissant',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 4.50,
  section: 'Pastries',
  item_description: 'Balthazar',
  img: 21
)

#######################################################

r1i12 = Item.create!(
  item_name: 'Topo Chico',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 6.50,
  section: 'Cold Drinks',
  item_description: 'Sparkling mineral water twelve ounces',
  img: 22
)

r1i12 = Item.create!(
  item_name: 'Martinellis Mini Apple Juice',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  price: 3.25,
  section: 'Cold Drinks',
  img: 23
)


##########SEEDING DOUBLE DUTCH ESPRESSO################################



d1i1 = Item.create!(
  item_name: 'Drip',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 3,
  section: 'Drinks',
  item_description: '16oz drip coffee',
  img: 24
)

d1i1 = Item.create!(
  item_name: 'Iced Drip',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 4,
  section: 'Drinks',
  item_description: '16oz iced drip coffee',
  img: 25
)

d1i1 = Item.create!(
  item_name: 'Cafe Au Lait',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 3,
  section: 'Drinks',
  item_description: 'Our specialty drip coffee with whole milk',
  img: 26
)


d1i1 = Item.create!(
  item_name: 'Iced Espresso',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 3,
  section: 'Drinks',
  item_description: '5oz iced espresso',
  img: 27
)


d1i1 = Item.create!(
  item_name: 'Iced Mocha',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 5,
  section: 'Drinks',
  item_description: 'Iced Mocha made with our specialty whipped cream and drip coffee',
  img: 28
)


d1i1 = Item.create!(
  item_name: 'Iced Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 3,
  section: 'Drinks',
  item_description: 'Iced tea with choice of green or black tea',
  img: 29
)


d1i1 = Item.create!(
  item_name: 'Mocha',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 4,
  section: 'Drinks',
  item_description: 'Mocha made with our specialty whipped cream',
  img: 30
)

d1i1 = Item.create!(
  item_name: 'Avocado Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 10,
  section: 'Toasts',
  item_description: 'Fresh avocado on our homemade sourdough toast',
  img: 31
)

d1i1 = Item.create!(
  item_name: 'Tuna Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 10,
  item_description: 'Tuna schmear on our homemade sourdough toast',
  section: 'Toasts',
  img: 32
)

d1i1 = Item.create!(
  item_name: 'Caprese Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 12,
  item_description: 'Homemade sourdough toast with fresh tomatoes and mozarella',
  section: 'Toasts',
  img: 33
)

d1i1 = Item.create!(
  item_name: 'Lemon Ricotta Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 12,
  item_description: 'Homemade sourdough toast with fresh lemon and ricotta',
  section: 'Toasts',
  img: 34
)

d1i1 = Item.create!(
  item_name: 'Granola Bowl',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 9,
  item_description: 'Homemade granola with an assortment of fruits and yogurt',
  section: 'Bowls',
  img: 35
)

d1i1 = Item.create!(
  item_name: 'Acai Bowl',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  price: 11,
  item_description: 'Fresh Acai with an assortment of other fruits',
  section: 'Bowls',
  img: 36
)

d1i1 = Item.create!(
  item_name: 'Rose Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  price: 6,
  item_description: 'Beautiful latte with a sprinkle of rose petals',
  section: 'Lattes',
  img: 37
)

d1i1 = Item.create!(
  item_name: 'Matcha Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  price: 7,
  item_description: 'Beautiful latte with fresh matcha',
  section: 'Lattes',
  img: 38
)

d1i1 = Item.create!(
  item_name: 'Lavendar Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  price: 7,
  item_description: 'Beautiful latte with fresh lavendar pedals',
  section: 'Lattes',
  img: 39
)

d1i1 = Item.create!(
  item_name: 'Raspberry tart',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  price: 3,
  item_description: 'Freshly baked raspberry tart',
  section: 'Bakery',
  img: 40
)


d1i1 = Item.create!(
  item_name: 'Matcha toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  price: 5,
  item_description: 'Freshly baked matcha toast with fresh matcha',
  section: 'Bakery',
  img: 41
)

d1i1 = Item.create!(
  item_name: 'Blueberry tart',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  price: 3,
  item_description: 'Freshly baked blueberry tart',
  section: 'Bakery',
  img: 42
)

d1i1 = Item.create!(
  item_name: 'Iced Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 4,
  section: 'Drinks',
  item_description: 'Iced tea with choice of green or black tea',
  img: 29
)


d1i1 = Item.create!(
  item_name: 'Mocha',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 4,
  section: 'Drinks',
  item_description: 'Mocha made with our specialty whipped cream',
  img: 30
)

d1i1 = Item.create!(
  item_name: 'Avocado Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 10,
  section: 'Toasts',
  item_description: 'Fresh avocado on our homemade sourdough toast',
  img: 31
)

d1i1 = Item.create!(
  item_name: 'Matcha Cream Puff',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 7,
  section: 'Pastries',
  item_description: 'Freshly baked cream puff with our homemade whipped filling',
  img: 43
)

d1i1 = Item.create!(
  item_name: 'Pig Pastry',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 7,
  section: 'Pastries',
  item_description: 'White tea mousse with lychee compote, strawberry cream & matcha almond cake.',
  img: 44
)



r1i3 = Item.create!(
  item_name: 'Chipotle Chicken Salad Bowl',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  price: 12.95,
  section: 'Kitchen',
  item_description: 'Mixed Greens with Avocado, Tomatoes, Cucumbers, Red Onions, Black Beans, Roasted Corn, Roasted Sweet Potatoes, Tossed in a Cilantro Lime Dressing with Chipotle Chicken (No substitutions allowed)',
  img: 3
)

r1i4 = Item.create!(
  item_name: 'Fresh Fruit Salad Cup',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  price: 8.50,
  section: 'Kitchen',
  item_description: 'Strawberries, Blueberries, Grapes, Pineapple with Lime Mint Syrup (Substitutions not allowed)',
  img: 4
)

Location.delete_all

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  address_1: '81 E 45th St',
  city: ' New York',
  state: 'NY',
  country: "United States"
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  #, , NY 10019, United States
  address_1: '2194 Frederick Douglass Blvd',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  #906 2nd Ave, New York, NY 10017, United States
  address_1: '906 2nd Ave',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  #253 W 51st St, New York, NY 10019, United States
  address_1: '253 W 51st St',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  #1 Rockefeller Plaza, New York, NY 10020, United States
  address_1: '1 Rockefeller Plaza',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  #81 E 7th St, New York, NY 10003, United States
  address_1: '81 E 7th St',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  #239 E 5th St, New York, NY 10003, United States
  address_1: '239 E 5th St',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Citizens of Gramercy').id,
  #362 2nd Ave, New York, NY 10010, United States
  address_1: '362 2nd Ave',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  #180 Mulberry St, New York, NY 10012, United States
  address_1: '180 Mulberry St',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)
Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  #21-10 51st Ave, Queens, NY 11101, United States
  address_1: '21-10 51st Ave',
  city: 'New York',
  state: 'NY',
  country: 'United States'
)


Location.create!(
  user_id: User.find_by(username: 'demouser@gmail.com').id,
  address_1: '20 W 34th St',
  city: 'New York City',
  state: 'NY',
  country: 'United States'
)

Location.find_by(user_id: User.find_by(username: 'demouser@gmail.com').id ).update(
  category: '28-40 Jackson Ave. Long Island City, New York',
  latitude: 40.750568,
  longitude: -73.993519
)

Tag.delete_all

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Partners Coffee').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Double Dutch Espresso').id,
  tag: 'dessert'
)


Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  tag: 'dessert'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Remi Flower & Coffee').id,
  tag: 'alcohol'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  tag: 'dessert'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  tag: 'coffee'
)



Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Citizens of Gramercy').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Citizens of Gramercy').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  tag: 'dessert'
)


Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  tag: 'alcohol'
)

Item.create!(
  item_name: 'Sweet Mocha Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Delicious hand-crafted mocha lattes',
  img: 'bb1'
)

Item.create!(
  item_name: 'Mango Juice',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Blue Bottle Coffee').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Artisinal mango juice in glass bottle',
  img: 'bb2'
)

Item.create!(
  item_name: 'Handcrafted Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Handcrafted hot latte with whole milk and freshly ground espresso beans.',
  img: 'Abraco1'
)

Item.create!(
  item_name: 'Drip Coffee',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  price: 3.95,
  section: 'Drinks',
  item_description: 'Drip coffee made with freshly ground coffee beans.',
  img: 'Abraco2'
)

Item.create!(
  item_name: 'Iced Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Fresh latte made with whole milk.',
  img: 'Abraco3'
)

Item.create!(
  item_name: 'Cheese and Herb Bread',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  price: 2.95,
  section: 'Bakery',
  item_description: 'Freshly baked cheese and herb bread.',
  img: 'Abraco4'
)

Item.create!(
  item_name: 'Chocolate and Vanilla Loaf',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Abraco').id,
  price: 2.95,
  section: 'Bakery',
  item_description: 'Freshly baked chocolate and vanilla cake loaf.',
  img: 'Abraco5'
)

Item.create!(
  item_name: 'Nitro Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  price: 6.95,
  section: 'Flights',
  item_description: 'Latte, foam coffee, an espresso shot, and a belgian waffle.',
  img: 'CoffeeProject1'
)

Item.create!(
  item_name: 'Latte Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  price: 6.95,
  section: 'Flights',
  item_description: 'Latte, warm milk, a shot of espresso, and a warm belgian waffle.',
  img: 'CoffeeProject2'
)

Item.create!(
  item_name: 'Espresso Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  price: 6.95,
  section: 'Flights',
  item_description: 'Coffee tasting at different intensities',
  img: 'CoffeeProject3'
)

Item.create!(
  item_name: 'Upgraded Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Coffee Project NYC').id,
  price: 7.95,
  section: 'Flights',
  item_description: 'Latte, warm milk, and a rich shot of espresso, with a belgian waffle.',
  img: 'CoffeeProject4'
)

Item.create!(
  item_name: 'Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Citizens of Gramercy').id,
  price: 4.95,
  section: 'Lattes',
  item_description: 'Latte made with fresh coffee and whole milk.',
  img: 'Gramercy1'
)

Item.create!(
  item_name: 'Matcha Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Citizens of Gramercy').id,
  price: 4.95,
  section: 'Lattes',
  item_description: 'Matcha Latte made with fresh coffee and whole milk.',
  img: 'Gramercy2'
)
Item.create!(
  item_name: 'Chai Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Citizens of Gramercy').id,
  price: 4.95,
  section: 'Lattes',
  item_description: 'Chai Latte made with fresh coffee and whole milk.',
  img: 'Gramercy3'
)

Item.create!(
  item_name: 'Nitro Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  price: 6.95,
  section: 'Flights',
  item_description: 'Latte, foam coffee, an espresso shot, and a belgian waffle.',
  img: 'CoffeeProject1'
)

Item.create!(
  item_name: 'Latte Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  price: 6.95,
  section: 'Flights',
  item_description: 'Latte, warm milk, a shot of espresso, and a warm belgian waffle.',
  img: 'CoffeeProject2'
)

Item.create!(
  item_name: 'Espresso Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  price: 6.95,
  section: 'Flights',
  item_description: 'Coffee tasting at different intensities',
  img: 'CoffeeProject3'
)

Item.create!(
  item_name: 'Upgraded Flight',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Academy at Coffee Project NY').id,
  price: 7.95,
  section: 'Flights',
  item_description: 'Latte, warm milk, and a rich shot of espresso, with a belgian waffle.',
  img: 'CoffeeProject4'
)




Restaurant.find_by(name: 'Partners Coffee').update(
  pricing: 2,
  rating: 4.5,
  number_of_ratings: 12,
  ready_in: 15,
  operating_time: '11:00 am - 7:00 pm'
)

Restaurant.find_by(name: 'Double Dutch Espresso').update(
  pricing: 1,
  rating: 4,
  number_of_ratings: 23,
  ready_in: 12,
  operating_time: '10:00 am - 8:00 pm'
)

Restaurant.find_by(name: 'Remi Flower & Coffee').update(
  pricing: 2,
  rating: 4.5,
  number_of_ratings: 33,
  ready_in: 8,
  operating_time: '10:00 am - 7:00 pm'
)

Restaurant.find_by(name: 'Bibble & Sip').update(
  pricing: 3,
  rating: 5,
  number_of_ratings: 11,
  ready_in: 12,
  operating_time: '12:00 pm - 9:00 pm'
)

Restaurant.find_by(name: 'Blue Bottle Coffee').update(
  pricing: 2,
  rating: 4,
  number_of_ratings: 33,
  ready_in: 9,
  operating_time: '10:00 am - 7:00 pm'
)

Restaurant.find_by(name: 'Abraco').update(
  pricing: 3,
  rating: 4.5,
  number_of_ratings: 16,
  ready_in: 14,
  operating_time: '10:00 am - 8:00 pm'
)

Restaurant.find_by(name: 'Coffee Project NYC').update(
  pricing: 2,
  rating: 4.5,
  number_of_ratings: 23,
  ready_in: 13,
  operating_time: '10:30 am - 7:00 pm'
)

Restaurant.find_by(name: 'Citizens of Gramercy').update(
  pricing: 1,
  rating: 4,
  number_of_ratings: 17,
  ready_in: 13,
  operating_time: '11:30 am - 8:30 pm'
)

Restaurant.find_by(name: 'Urban Backyard').update(
  pricing: 2,
  rating: 5,
  number_of_ratings: 14,
  ready_in: 13,
  operating_time: '11:00 am - 7:00 pm'
)

Restaurant.find_by(name: 'Academy at Coffee Project NY').update(
  pricing: 2,
  rating: 4,
  number_of_ratings: 35,
  ready_in: 12,
  operating_time: '10:00 am - 8:00 pm'
)


Item.create!(
  item_name: 'Lavendar Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Lavendar Latte with whole milk',
  img: 'Urban3'
)


Item.create!(
  item_name: 'Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  price: 3.95,
  section: 'Drinks',
  item_description: 'Latte with whole milk',
  img: 'Urban2'
)

Item.create!(
  item_name: 'Sweet Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  price: 3.95,
  section: 'Drinks',
  item_description: 'Refreshing homemade sweet tea',
  img: 'Urban5'
)

Item.create!(
  item_name: 'Iced Lavendar Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Refreshing iced lavendar latte with whole milk',
  img: 'Urban6'
)



Item.create!(
  item_name: 'Rose Cupcake',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  price: 3.95,
  section: 'Cupcakes',
  item_description: 'Hand crafted miniature cupcake in the shape of a rose',
  img: 'Urban4'
)

Item.create!(
  item_name: 'Cactus Cupcakes (3)',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Urban Backyard').id,
  price: 9.95,
  section: 'Cupcakes',
  item_description: 'Hand crafted miniature cupcakes in the shape of cacti',
  img: 'Urban1'
)



Restaurant.create!(
  name: 'Home Coffee Roasters',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 37.7912051,
  longitude: -122.4060427,
  img1: '/Home1.png',
  img2: '/Home2.png',
  price_level: 3,
  description: "Perfect for a mid-afternoon coffee break during a long workday.",
  pricing: 3,
  rating: 4.0,
  number_of_ratings: 15,
  ready_in: 10,
  operating_time: '10:00 am - 8:30 pm'
)

Item.create!(
  item_name: 'Red Velvet Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Hand crafted red velvelt latte',
  img: 'Home3'
)

Item.create!(
  item_name: 'Birthday Cake Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 5.95,
  section: 'Drinks',
  item_description: 'Hand crafted birthday cake latte with confetti',
  img: 'Home4'
)


Item.create!(
  item_name: 'Chocolate Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 5.95,
  section: 'Drinks',
  item_description: 'Hand crafted chocolate latte with confetti',
  img: 'Home5'
)


Item.create!(
  item_name: 'Matcha Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Hand crafted matcha latte with whole milk.',
  img: 'Home6'
)

Item.create!(
  item_name: 'Regular Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 3.95,
  section: 'Drinks',
  item_description: 'Hand crafted plain latte with whole milk.',
  img: 'Home7'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  #, , NY 10019, United States
  address_1: '1222 Noriega St',
  city: 'San Francisco',
  state: 'CA',
  country: 'United States'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  tag: 'dessert'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  tag: 'alcohol'
)

Restaurant.create!(
  name: 'Rise & Grind Coffee and Tea',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 37.7737055,
  longitude: -122.4659307,
  img1: '/Rise1.png',
  img2: '/Rise2.png',
  description: "Great place for coffee and friendly staff. ",
  pricing: 1,
  rating: 4.5,
  number_of_ratings: 23,
  ready_in: 8,
  operating_time: '9:00 am - 8:30 pm'
)

Item.create!(
  item_name: 'Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Delicious latte with fresh oat milk',
  img: 'Rise3'
)

Item.create!(
  item_name: 'Cappucino with chocolate crumble',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Delicious cappucino with crumbled dark chocolate',
  img: 'Rise4'
)

Item.create!(
  item_name: 'Breakfast Bunwich',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  price: 6.95,
  section: 'Kitchen',
  item_description: 'Artisinal breakfast sandwich with poached egg, cheese, avocado, and bacon.',
  img: 'Rise5'
)

Item.create!(
  item_name: 'Avocado Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  price: 5.95,
  section: 'Kitchen',
  item_description: 'Avocado toast with poached egg.',
  img: 'Rise6'
)

Item.create!(
  item_name: 'Grapefruit Green Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 6.75,
  section: 'Fruit Tea',
  item_description: '',
  img: 'ygo1'
)

Item.create!(
  item_name: 'Pineapple Green Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 6.25,
  section: 'Fruit Tea',
  item_description: '',
  img: 'ygo2'
)

Item.create!(
  item_name: 'Supreme Fruit Tea Slush with Cheese Cream',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 7.25,
  section: 'Fruit Slush',
  item_description: 'Fixed Sugar and Ice Level',
  img: 'ygo3'
)

Item.create!(
  item_name: 'Yakult Lemon Slush',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  price: 7.25,
  section: 'Fruit Slush',
  item_description: 'Fixed Sugar and Ice Level',
  img: 'ygo4'
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  #, , NY 10019, United States
  address_1: '785 8th Ave',
  city: 'San Francisco',
  state: 'CA',
  country: 'United States'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Rise & Grind Coffee and Tea').id,
  tag: 'alcohol'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Home Coffee Roasters').id,
  tag: 'bbt'
)

Restaurant.create!(
  name: 'The Mill',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 37.7764979,
  longitude: -122.4378009,
  img1: '/Mill1.png',
  img2: '/Mill2.png',
  description: "We freshly mill grains to produce bread that is as flavorful as it is nourishing. We use high quality locally sourced ingredients to put on top of all of our toast options",
  pricing: 2,
  rating: 3.5,
  number_of_ratings: 39,
  ready_in: 9,
  operating_time: '11:00 am - 8:30 pm'
)


Item.create!(
  item_name: 'Herb Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  price: 4.25,
  section: 'Toast',
  item_description: 'Herbs on cream cheese and fresh toast.',
  img: 'Mill3'
)

Item.create!(
  item_name: 'Pesto Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  price: 4.25,
  section: 'Toast',
  item_description: 'Pesto on cream cheese and fresh toast.',
  img: 'Mill4'
)

Item.create!(
  item_name: 'Mocha Coffee',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  price: 3.25,
  section: 'Coffee',
  item_description: 'Fresh coffee with mocha.',
  img: 'Mill5'
)

Item.create!(
  item_name: 'Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  price: 3.25,
  section: 'Coffee',
  item_description: 'Fresh latte with whole milk.',
  img: 'Mill6'
)


Location.create!(
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  #, , NY 10019, United States
  address_1: '736 Divisadero St',
  city: 'San Francisco',
  state: 'CA',
  country: 'United States'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  tag: 'dessert'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'The Mill').id,
  tag: 'alcohol'
)



Restaurant.create!(
  name: 'Snowbird Coffee',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 37.7631074,
  longitude: -122.4662671,
  img1: '/Snowbird1.png',
  img2: '/Snowbird2.png',
  description: "Great drinks, chill atmosphere, professional, and efficient",
  pricing: 3,
  rating: 4.5,
  number_of_ratings: 29,
  ready_in: 11,
  operating_time: '10:00 am - 8:30 pm'
)


d1i1 = Item.create!(
  item_name: 'Iced Tea',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  price: 4,
  section: 'Drinks',
  item_description: 'Iced tea with choice of green or black tea',
  img: 29
)


d1i1 = Item.create!(
  item_name: 'Mocha',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  price: 4,
  section: 'Drinks',
  item_description: 'Mocha made with our specialty whipped cream',
  img: 30
)

d1i1 = Item.create!(
  item_name: 'Avocado Toast',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  price: 10,
  section: 'Toasts',
  item_description: 'Fresh avocado on our homemade sourdough toast',
  img: 31
)

d1i1 = Item.create!(
  item_name: 'Matcha Cream Puff',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  price: 7,
  section: 'Pastries',
  item_description: 'Freshly baked cream puff with our homemade whipped filling',
  img: 43
)

d1i1 = Item.create!(
  item_name: 'Pig Pastry',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  price: 7,
  section: 'Pastries',
  item_description: 'White tea mousse with lychee compote, strawberry cream & matcha almond cake.',
  img: 44
)

Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  #, , NY 10019, United States
  address_1: '1352 A 9th Ave',
  city: 'San Francisco',
  state: 'CA',
  country: 'United States'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Snowbird Coffee').id,
  tag: 'dessert'
)

Restaurant.create!(
  name: 'Neighbors Corner',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 37.7555315,
  longitude: -122.4388793,
  img1: '/Neighbor1.png',
  img2: '/Neighbor2.png',
  description: "Great location with a neighborhood vibe, friendly owners and cold brew",
  pricing: 1,
  rating: 5,
  number_of_ratings: 27,
  ready_in: 15,
  operating_time: '10:30 am - 9:30 pm'
)

Item.create!(
  item_name: 'Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Neighbors Corner').id,
  price: 4.95,
  section: 'Lattes',
  item_description: 'Latte made with fresh coffee and whole milk.',
  img: 'Gramercy1'
)

Item.create!(
  item_name: 'Matcha Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Neighbors Corner').id,
  price: 4.95,
  section: 'Lattes',
  item_description: 'Matcha Latte made with fresh coffee and whole milk.',
  img: 'Gramercy2'
)
Item.create!(
  item_name: 'Chai Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Neighbors Corner').id,
  price: 4.95,
  section: 'Lattes',
  item_description: 'Chai Latte made with fresh coffee and whole milk.',
  img: 'Gramercy3'
)

  Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Neighbors Corner').id,
  #, , NY 10019, United States
  address_1: '499 Douglass St San Francisco',
  city: 'San Francisco',
  state: 'CA',
  country: 'United States'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Neighbors Corner').id,
  tag: 'coffee'
)


Restaurant.create!(
  name: 'Golden Goat Coffee',
  email: 'partners@gmail.com',
  phone: '000-000-0000',
  latitude: 37.7802546,
  longitude: -122.3945106,
  img1: '/Goat1.png',
  img2: '/Goat2.png',
  description: "The coffee and warm-hearted service attract and welcome the entire neighborhood, and beyond.",
  pricing: 2,
  rating: 5,
  number_of_ratings: 45,
  ready_in: 13,
  operating_time: '10:00 am - 11:30 pm'
)


Item.create!(
  item_name: 'Handcrafted Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Handcrafted hot latte with whole milk and freshly ground espresso beans.',
  img: 'Abraco1'
)

Item.create!(
  item_name: 'Drip Coffee',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  price: 3.95,
  section: 'Drinks',
  item_description: 'Drip coffee made with freshly ground coffee beans.',
  img: 'Abraco2'
)

Item.create!(
  item_name: 'Iced Latte',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  price: 4.95,
  section: 'Drinks',
  item_description: 'Fresh latte made with whole milk.',
  img: 'Abraco3'
)

Item.create!(
  item_name: 'Cheese and Herb Bread',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  price: 2.95,
  section: 'Bakery',
  item_description: 'Freshly baked cheese and herb bread.',
  img: 'Abraco4'
)

Item.create!(
  item_name: 'Chocolate and Vanilla Loaf',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  price: 2.95,
  section: 'Bakery',
  item_description: 'Freshly baked chocolate and vanilla cake loaf.',
  img: 'Abraco5'
)

  Location.create!(
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  #, , NY 10019, United States
  address_1: '599 3rd St San Francisco',
  city: 'San Francisco',
  state: 'CA',
  country: 'United States'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  tag: 'coffee'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  tag: 'dessert'
)


Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Golden Goat Coffee').id,
  tag: 'tea'
)

Tag.create!(
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  tag: 'bbt'
)

Item.create!(
  item_name: 'Taro Boba',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 6.75,
  section: 'Boba',
  item_description: '',
  img: 'Bibble10'
)

Item.create!(
  item_name: 'Matcha Boba',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 6.25,
  section: 'Boba',
  item_description: '',
  img: 'Bibble11'
)

Item.create!(
  item_name: 'Strawberry Boba',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 7.25,
  section: 'Boba',
  item_description: 'Fixed Sugar and Ice Level',
  img: 'Bibble12'
)

Item.create!(
  item_name: 'Coffee Boba',
  availability: true,
  restaurant_id: Restaurant.find_by(name: 'Bibble & Sip').id,
  price: 7.25,
  section: 'Boba',
  item_description: 'Fixed Sugar and Ice Level',
  img: 'Bibble13'
)
