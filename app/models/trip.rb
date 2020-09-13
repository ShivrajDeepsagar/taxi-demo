class Trip < ApplicationRecord
  belongs_to :customer
  belongs_to :cab
end
