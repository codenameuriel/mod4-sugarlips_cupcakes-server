class User < ApplicationRecord
    has_one :profile
    has_many :carts
    has_many :cupcakes, through: :carts
end
