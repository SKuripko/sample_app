# frozen_string_literal: true

require 'spec_helper'

describe 'Authentication' do
  subject { page }

  describe 'signin page' do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe 'signin' do
    before { visit signin_path }

    describe 'with invalid information' do
      before { click_button 'Sign in' }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }

      describe 'after visiting another page' do
        before { click_link 'Home' }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end

  describe 'with valid information' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit signin_path
      fill_in 'Email',    with: user.email.upcase
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    it { should has_title?(user.name) }
    it { should has_link?('Add user') }
    it { page.has_link?('Sign out',           href: signout_path) }
    it { expect(page).to have_link('Sign in', href: signin_path) }

    describe 'followed by signout' do
      before { click_link 'Sign out' }
      it { should have_link('Sign in') }
    end
  end
end
