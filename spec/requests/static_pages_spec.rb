require 'spec_helper'
require 'rails_helper'

describe "Static pages"  do

	subject { page }

	#Тест заголовка Home страницы
	describe "Home page" do 
		before { visit root_path }

		it {should have_content('Sample App') }
		it {should have_title(full_title('')) }
		it {should_not have_title('| Home') }		
	end	

	#Тест заголовка Help страницы
	describe "Help page" do 
		before { visit help_path }

		it { should have_content('Help')}
		it { should have_title(full_title(''))}	
	end		

	#Тест заголовка About страницы
	describe "About page" do 
		before { visit about_path }

		it { should have_content('About') }
		it { should has_title?(full_title('About Us')) }		    
	end    	

	#Тесты для страницы Contact
	describe "Contact page" do
		before { visit contact_path }

		it { should have_content('Contact') }
		it { should has_title?(full_title('Contact')) }		
	end			 
end