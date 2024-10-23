class Quote < ApplicationRecord
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc)}

  #default target is model_name.plural  -> target: "quotes"
  #default partial is calling to_partial_path on an instance of the model -> partial: "quotes/quote"
  #The locals default value is equal to { model_name.element.to_sym => self } -> locals { quote: self }
  after_create_commit -> { broadcast_prepend_later_to "quotes" } # asynchronous
  after_update_commit -> { broadcast_replace_later_to "quotes" } # aysnchronous
  after_destroy_commit -> { broadcast_remove_to "quotes" }

end
