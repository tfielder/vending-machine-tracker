require 'rails_helper'

feature 'When a user visits snack show page' do
  scenario 'they see the name, price, locations that carry the snack that snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "White Castle Burger", price:3.50)
    snack2 = dons.snacks.create(name: "Pop Rocks", price:1.50)
    snack3 = dons.snacks.create(name: "Flaming Hot Cheetos", price:2.50)
    sues = owner.machines.create(location: "Sue's Mixed Drinks")
    snack4 = sues.snacks.create(name: "White Castle Burger", price:3.50)
    snack5 = sues.snacks.create(name: "Pop Rocks", price:1.50)
    snack6 = sues.snacks.create(name: "Flaming Hot Cheetos", price:2.50)

    visit snack_path(snack1)

    expect(page).to have_content("Snack: #{snack1.name}: $#{snack.price}")
    expect(page).to have_content("Locations: #{snack1.name}: $#{snack.price}")

  end
  scenario 'they see average price for all snacks in vending machines and count of different kinds of items' do
  end
end



# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
