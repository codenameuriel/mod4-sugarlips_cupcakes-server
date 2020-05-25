class User < ApplicationRecord
    has_many :carts
    has_many :cupcakes, through: :carts
end
