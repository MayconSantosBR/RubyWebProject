class Person < ApplicationRecord
    has_many :users
    has_many :establishments
end
