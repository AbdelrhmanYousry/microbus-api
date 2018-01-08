class CompletedJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    offer = args[0]

    if offer.update status: "completed"
      	offer.pay_to_vendor
    end

  end
end
