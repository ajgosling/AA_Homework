module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = self.toys.find_by(name: name)
    if toy
      toy.toyable_id = self.id
    else
      Toy.new(name: name, toyable_id: self.id)
    end
  end
end