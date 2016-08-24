class Settlement < ActiveRecord::Base
  belongs_to :expense
  belongs_to :payee, class_name: Person, foreign_key: :payee_id
  belongs_to :payer, class_name: Person, foreign_key: :payer_id

end
