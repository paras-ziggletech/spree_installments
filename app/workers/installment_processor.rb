class InstallmentProcessor
  @queue = :installment_queue

  def self.perform
    due_installments = Spree::Installment.past_due(Time.now)
    due_installments.each do |due_installment|
      due_installment.capture!
    end
  end
end