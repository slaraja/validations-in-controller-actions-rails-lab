class Author < ActiveRecord::Base
    validates :name, :email, presence: true
    validates :name, :email, uniqueness: true
end
