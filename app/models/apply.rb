class Apply < ApplicationRecord
  belongs_to :user

  include AASM

  aasm do
    state :apply_sended, initial: true
    state :apply_passing
    state :apply_passed
    state :apply_failed

    event :passing do
      transitions from: :apply_sended, to: :apply_passing
    end

    event :passed do
      transitions from: :apply_passing, to: :apply_passed
    end

    event :failed do
      transitions from: :apply_passing, to: :apply_failed
    end
  end

end
