class Group < ApplicationRecord
  belongs_to :user
  has_many :payments, through: :payment_items, dependent: :delete_all
  has_many :payment_items, dependent: :delete_all
  has_one_attached :icon

  validates :icon, presence: true
  validates :name, presence: true

  def total_amount_by_group(group_id)
    payments.joins(:payment_items).where(payment_items: { group_id: group_id }).sum('payments.amount')
  end
end
