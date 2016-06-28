require 'rails_helper'

feature "navigation bar when logged out" do

  scenario 'link for Home' do
    visit '/'
    expect(page).to have_link('Home', href: '/')
  end

  scenario 'link for Teams' do
    visit '/'
    expect(page).to have_link('Teams', href: '/teams')
  end

  scenario 'link for Schedule' do
    visit '/'
    expect(page).to have_link('Schedule', href: '/games')
  end

  scenario 'link for Login' do
    visit '/'
    expect(page).to have_link('Login', href: '/league_admins/sign_in')
  end

end

feature "navigation bar when logged in" do

  scenario 'link for Logout' do
    LeagueAdmin.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'password')
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    visit '/'
    expect(page).to have_link('Logout', href: '/league_admins/sign_out')
  end

end
