# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name                  'Michael Hartl'
    email                 'michael@example.com'
    password              'foobar'
    password_confirmation 'foobar'
  end
end
