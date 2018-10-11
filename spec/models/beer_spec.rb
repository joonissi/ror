require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is saved to db if name style and brewery is set properly" do
    brewery = Brewery.create name:"Koff", year:1987
    style = Style.create name:"Lager", description: "jee jee"
    
    beer = Beer.create name:"Koff APA", style_id:style.id, brewery_id:brewery.id 

    expect(beer.valid?).to be(true)
    expect(Brewery.count).to eq(1)
    expect(Beer.count).to eq(1)
  end

  it "is not saved if name or style are not set" do
    brewery = Brewery.create name:"Koff", year:1987
    beer = Beer.create brewery_id:brewery.id

    expect(beer.valid?).to be(false)
    expect(Brewery.count).to eq(1)
    expect(Beer.count).to eq(0)
  end
end
