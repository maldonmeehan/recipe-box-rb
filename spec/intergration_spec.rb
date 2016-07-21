require('spec_helper')

describe('the home page route', :type => :feature) do
  it "takes us to the home page" do
    visit '/'
    expect(page).to have_content('Welcome')
  end
end

describe('the recipe route', :type => :feature) do
  it("allows the user to name a new recipe") do
    visit '/'
    fill_in 'name', :with => 'Jerk Chicken'
    click_button 'Go!'
    expect(page).to have_content('Jerk Chicken')
  end

  it('allows a user to enter an ingredient to their recipe') do
    visit '/'
    fill_in 'name', :with => 'Jerk Chicken'
    click_button 'Go!'
    fill_in 'ingredient', :with => 'Chicken'
    click_button 'Add'
    expect(page).to have_content('Chicken')
  end

  it('allows a user to enter instructions for their recipe') do
    visit '/'
    fill_in 'name', :with => 'Jerk Chicken'
    click_button 'Go!'
    fill_in 'instruction', :with => 'Wash the chicken, salt (pinch) and let sweat for 10 min. Add pepper and bake at 350 for 2 hours'
    click_button 'Submit'
    expect(page).to have_content('Wash the chicken')
  end

  it('allows a user to view their complete recipe') do
    visit '/'
    fill_in 'name', :with => 'Jerk Chicken'
    click_button 'Go!'
    fill_in 'ingredient', :with => 'Chicken'
    click_button 'Add'
    fill_in 'ingredient', :with => 'Salt'
    click_button 'Add'
    fill_in 'ingredient', :with => 'Pepper'
    click_button 'Add'
    fill_in 'instruction', :with => 'Wash the chicken, salt (pinch) and let sweat for 10 min. Add pepper and bake at 350 for 2 hours'
    click_button 'Submit'
    click_button 'See My Recipe'
    expect(page).to have_content('Jerk Chicken')
  end
end


#
#     fill_in 'ingredient1', :with => 'Chicken'
#     fill_in 'ingredient2', :with => 'Salt'
#     fill_in 'ingredient3', :with => 'Pepper'
#     fill_in 'instruction', :with => 'Wash the chicken, salt (pinch) and let sweat for 10 min. Add pepper and bake at 350 for 2 hours'
#     click_button 'Submit'
#     expect(page).to have_content('Jerk Chicken')
#   end
# end
