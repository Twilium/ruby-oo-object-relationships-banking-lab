require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if valid? && @status = "pending" && @sender.balance > @amount
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
        @status = "complete"
        @receiver.status = "complete"
        @sender.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

      def reverse_transfer
        if @status == "complete"
          self.status = "reversed"
          @sender.balance = @sender.balance + @amount
          @receiver.balance = @receiver.balance - @amount
        else 
        end

      end
end
