require 'rails_helper'

describe "Beerlist page" do
  before :all do
    Capybara.register_driver :selenium do |app|
      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: { args: ['headless', 'disable-gpu']  }
      )

      Capybara::Selenium::Driver.new app,
        browser: :chrome,
        desired_capabilities: capabilities      
    end
    WebMock.disable_net_connect!(allow_localhost: true) 
  end

  before :each do
    @brewery1 = FactoryBot.create(:brewery, name:"Koff")
    @brewery2 = FactoryBot.create(:brewery, name:"Schlenkerla")
    @brewery3 = FactoryBot.create(:brewery, name:"Ayinger")
    @style1 = Style.create name:"Lager"
    @style2 = Style.create name:"Rauchbier"
    @style3 = Style.create name:"Weizen"
    @beer1 = FactoryBot.create(:beer, name:"Nikolai", brewery: @brewery1, style:@style1)
    @beer2 = FactoryBot.create(:beer, name:"Fastenbier", brewery:@brewery2, style:@style2)
    @beer3 = FactoryBot.create(:beer, name:"Lechte Weisse", brewery:@brewery3, style:@style3)
  end

  it "shows one known beer", js:true do
    visit beerlist_path
    
    expect(page).to have_content "Nikolai"
  end

  it "shows beer sorted by name by default", js:true do
    visit beerlist_path
    
    faste = find('table').find('tr:nth-child(2)')
    expect(faste).to have_content "Fastenbier"

    lechte = find('table').find('tr:nth-child(3)')
    expect(lechte).to have_content "Lechte Weisse"

    niko = find('table').find('tr:nth-child(4)')
    expect(niko).to have_content "Nikolai"
  end

  it "shows styles sorted when we click styles link", js:true do
    visit beerlist_path

    click_link('Style')
    #save_and_open_page

    n1 = find('table').find('tr:nth-child(2)')
    expect(n1).to have_content "Lager"

    n2 = find('table').find('tr:nth-child(3)')
    expect(n2).to have_content "Rauchbier"

    n3 = find('table').find('tr:nth-child(4)')
    expect(n3).to have_content "Weizen"
    
  end

  it "shows breweries sorted when we click breweries link", js:true do
    visit beerlist_path

    click_link('Brewery')
    #save_and_open_page

    n1 = find('table').find('tr:nth-child(2)')
    expect(n1).to have_content "Ayinger"

    n2 = find('table').find('tr:nth-child(3)')
    expect(n2).to have_content "Koff"

    n3 = find('table').find('tr:nth-child(4)')
    expect(n3).to have_content "Schlenkerla"
    
  end
end