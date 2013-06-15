r1 = Resource.create! name: "Coffee and other Drinks"
r2 = Resource.create! name: "Speakers Room"
r4 = Resource.create! name: "Entrace"
r5 = Resource.create! name: "Hacktrack"
r6 = Resource.create! name: "Foodstation (Meat)"
r7 = Resource.create! name: "FoodStation (Veggie)"

Achievement.create! title: "CARNIVORE!",               description: "I hate Descriptions! They are the WURST!", achievement_type: 'counter', resource: r6
Achievement.create! title: "I like Animals",           description: "OM NOM NOM COOKIES! Err.. Salad..",        achievement_type: 'counter', resource: r7
Achievement.create! title: "Silent Listener",          description: "Visit at least 5 Talks",                   settings: {count: 5}, achievement_type: 'counter', resource: r2
Achievement.create! title: "Coffee Junkie",            description: "Get at least 20 Drinks",                   settings: {count: 20}, achievement_type: 'counter', resource: r1
Achievement.create! title: "I come here often!",       description: "Visit on 2 or more Days",                  settings: {count: 2}, achievement_type: 'counter', resource: r4
Achievement.create! title: "Work it, make it, do it",  description: "Then shalt thou visit three Hacktracks, no more, no less. Three shall be the number thou shalt visit, and the number of the visits shall be three. Four shalt thou not visit, neither visit two, excepting that thou then proceed to visit three. Five is right out. Once the number three, being the third number, be reached, then the Achievement is unlocked.", settings: {count: 3}, achievement_type: 'counter', resource: r5