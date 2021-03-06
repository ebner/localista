class Item < ActiveRecord::Base
  belongs_to :user
  FOODNAMES = [
    'Asparagus',
    'Almonds',
    'Apples',
    'Apricots',
    'Avocados',
    'Bananas',
    'Barley',
    'Basil',
    'Bear',
    'Beef',
    'Beets',
    'Black beans',
    'Black pepper',
    'Blueberries',
    'Bread',
    'Broccoli',
    'Brown rice',
    'Brussels sprouts',
    'Cabbage',
    'Calf',
    'Carrots',
    'Cashews',
    'Cauliflower',
    'Cayenne pepper',
    'Celery',
    'Cheese',
    'Cherries',
    'Chicken',
    'Chickpeas',
    'Cilantro/Coriander',
    'Cinnamon',
    'Cloves',
    'Corn',
    'Cranberries',
    'Crayfish',
    'Cucumbers',
    'Cumin seeds',
    'Deer',
    'Dill',
    'Duck',
    'Eggplant',
    'Eggs',
    'Fennel',
    'Figs',
    'Fish',
    'Flowers',
    'Garlic',
    'Ginger',
    'Goose',
    'Grapefruit',
    'Grapes',
    'Green beans',
    'Green peas',
    'Kangaroo',
    'Kidney beans',
    'Kiwifruit',
    'Lamb',
    'Leek',
    'Lemon',
    'Lentils',
    'Lettuce',
    'Limes',
    'Milk',
    'Moose',
    'Mushrooms',
    'Mustard seeds',
    'Olive oil',
    'Olives',
    'Onion',
    'Oranges',
    'Oregano',
    'Papaya',
    'Paprika',
    'Parsley',
    'Peanuts',
    'Pears',
    'Pepper',
    'Peppermint',
    'Pheasant',
    'Pineapple',
    'Plums',
    'Pork',
    'Potatoes',
    'Prunes',
    'Pumpkin',
    'Pumpkin seeds',
    'Quail',
    'Quinoa',
    'Rabbit',
    'Raisins',
    'Raspberries',
    'Reindeer',
    'Roe deer',
    'Rosemary',
    'Rye',
    'Sage',
    'Sesame seeds',
    'Soybeans',
    'Spelt',
    'Spinach',
    'Squash',
    'Strawberries',
    'Sunflower seeds',
    'Sweet potatoes',
    'Thyme',
    'Tomatoes',
    'Turkey',
    'Venison',
    'Walnuts',
    'Watermelon',
    'Whole wheat',
    'Wild boar',
    'Yogurt'
  ]
end