class ExpiredJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    offer = args[0]
    unless offer.status == "completed"
	  	if offer.update status: "expired"
	      	offer.destination_transactions.refund
          offer.notify
          offer.notify_consumers_failure
	    end
    end

    # unless offer.status === "completed"
    # 	offer.status = "expired"
    # end
  end
end
