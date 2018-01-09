class ExpiredJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    offer = args[0]
    offer.notify
    unless offer.status == "completed"
	  	if offer.update status: "expired"
	      	offer.destination_transactions.refund
	    end
    end

    # unless offer.status === "completed"
    # 	offer.status = "expired"
    # end
  end
end
