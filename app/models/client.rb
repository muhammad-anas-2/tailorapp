class Client < ApplicationRecord
  validates :name, presence: true, format: { :with => /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :serial_no, presence: true , uniqueness: true, numericality: true
  validates :phone, :numericality => true,
            :length => { :minimum => 11, :maximum => 13 }
end
