class HipchatMessage

  attr_accessor :type
  attr_accessor :uri
  attr_accessor :amount

  def initialize attributes={}
    self.type = attributes[:type]
    self.uri = attributes[:uri]
    self.amount = attributes[:amount]
  end

  def self.new_from_request(request_body)
    request = JSON.parse request_body
    self.new(type:   request['type'],
             uri:    request['entity']['uri'],
             amount: request['entity']['amount'])
  end

  def to_h
    {text:"#{type} - #{amount} - #{uri}", notify:should_notify?, color:set_color}
  end

  def valid?
    type !=nil && uri != nil
  end

  def should_notify?
    case type
    when 'debit.succeeded'
      true
    when 'debit.failed'
      true
    when 'credit.succeeded'
      true
    when 'credit.failed'
      true
    else
      false
    end
  end

  def set_color
    case type
    when 'debit.failed'
      'red'
    when 'credit.failed'
      'red'
    when 'refund.failed'
      'red'
    when 'debit.succeeded'
      'green'
    when 'credit.succeeded'
      'green'
    when /hold/
      'yellow'
    when /refund/
      'yellow'
    else
      'gray'
    end
  end
end
