class Event < ApplicationRecord
    # validates :name, presence: {message: "must be given"}
    # validates :event_type,  presence: {message: "must be given"}, inclusion: { in: %w( click view edit), message: "%{value} is not a valid event type" }
end
