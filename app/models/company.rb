class Company < ActiveRecord::Base
  has_many :freebies 
  has_many :devs, through: :freebies

  def give_freebie (dev_instance, new_item_name, value_given)
    Freebie.create(
      item_name: new_item_name,
      value: value_given,
      dev_id: dev_instance.id,
      company_id: self.id
    )
  end

  def self_oldest_company
    self.order(:founding_year).first
  end
  
end
