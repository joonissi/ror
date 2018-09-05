b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1040

b1.beers.create name:"Iso 3", style:"Lager", brewery_id: 1
b1.beers.create name:"Karhu", style:"Lager", brewery_id: 2
b1.beers.create name:"Tuplahumala", style:"Lager", brewery_id: 3
b2.beers.create name:"Huvila Pale Ale", style:"Pale Ale", brewery_id: 1
b2.beers.create name:"X Porter", style:"Porter", brewery_id: 2
b3.beers.create name:"Hefeweizen", style:"Weizen", brewery_id: 2
b3.beers.create name:"Helles", style:"Lager", brewery_id: 3