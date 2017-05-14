class Tweet < ActiveRecord::Base
    validates :tweet, length: { minimum: 1 } 
    validates :tweet, length: { maximum: 140 }
end
