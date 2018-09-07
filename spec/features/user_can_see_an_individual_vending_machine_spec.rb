require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "White Castle Burger", price:3.50)
    snack2 = dons.snacks.create(name: "Pop Rocks", price:1.50)
    snack3 = dons.snacks.create(name: "Flaming Hot Cheetos", price:2.50)

    visit machine_path(dons)
    expect(page).to have_content("Snacks!")

    expect(page).to have_content("#{snack1.name}")
    expect(page).to have_content("#{snack2.name}")
    expect(page).to have_content("#{snack3.name}")
  end
  scenario 'they see an average price for all of the snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "White Castle Burger", price:3.50)
    snack2 = dons.snacks.create(name: "Pop Rocks", price:1.50)
    snack3 = dons.snacks.create(name: "Flaming Hot Cheetos", price:2.50)

    visit machine_path(dons)
    expect(page).to have_content("Average Price: #{dons.average}")
  end
end
