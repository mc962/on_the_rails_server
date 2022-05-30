class Role < ApplicationRecord
  VALID_ROLES = %w[basic author editor admin superuser].freeze
  DEFAULT = 'basic'
  MANAGEMENT_ROLES = %i[admin superuser].freeze
  CONTENT_MANAGEMENT_ROLES = %i[editor admin superuser].freeze

  has_and_belongs_to_many :users, join_table: :users_roles
  
  belongs_to :resource,
             :polymorphic => true,
             :optional => true
  

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
end
