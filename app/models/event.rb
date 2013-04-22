class Event < ActiveRecord::Base
  attr_accessible :body, :date, :title

  searchable do 
    text :title, :boost => 5
    text :body, :publish_month, :date 
    time :updated_at  #makes time posted searchable.
  end


  def publish_month
    updated_at.strftime("%B %Y")
  end

end
