class ExpiredJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    offer = args[0]

    unless offer.status === "completed"
    	offer.status = "expired"
    end
  end
end
