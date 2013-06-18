r1 = Resource.create! name: "Coffee", short: 'coffee'
r2 = Resource.create! name: "Speakers Room", short: 'speaker'
r3 = Resource.create! name: "Drinks", short: 'drink'
r4 = Resource.create! name: "Play some table soccer", short: 'soccer'
r5 = Resource.create! name: "Hacktrack", short: 'hack'
r6 = Resource.create! name: "Foodstation (Meat)", short: 'meat'
r7 = Resource.create! name: "FoodStation (Veggie)", short: 'veggie'
Resource.create! name: "Status-Monitor", key: 'status-monitor'

a1 = Achievement.create! title: "Meat!!!",               description: "A least 2 times meat eaten!", achievement_type: 'counter'
a1.resources << r6

a2 = Achievement.create! title: "I don't like Animals",           description: "OM NOM NOM COOKIES! Err.. Salad..",        achievement_type: 'counter'
a2.resources << r7

a3 = Achievement.create! title: "Silent Listener",          description: "Visit at least 5 Talks",                   settings: {count: 5}, achievement_type: 'counter'
a3.resources << r2

a4 = Achievement.create! title: "Coffee Junkie",            description: "Get at least 10 Coffee",                   settings: {count: 10}, achievement_type: 'counter'
a4.resources << r1

a4 = Achievement.create! title: "Drink Junkie",            description: "Get at least 10 Drinks",                   settings: {count: 10}, achievement_type: 'counter'
a4.resources << r3

a5 = Achievement.create! title: "Gamer!",       description: "Play at least 5 times table soccer",                  settings: {count: 5}, achievement_type: 'counter'
a5.resources << r4

a6 = Achievement.create! title: "Work it, make it, do it",  description: "Visit 3 Hacktracks", settings: {count: 3}, achievement_type: 'counter'
a6.resources << r5

a7 = Achievement.create! title: "Achievement 101",          description: "Checkin for the very first time",          achievement_type: 'counter'
Resource.all.each{|r| a7.resources << r}
