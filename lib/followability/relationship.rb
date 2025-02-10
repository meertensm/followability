module Followability
  class Relationship < ActiveRecord::Base
    STATUSES = %i[requested blocked following].freeze

    # Rails 8 requires :field_name, hash syntax
    enum :status, requested: 0, blocked: 1, following: 2

    validates :status, presence: true

    belongs_to :followerable, polymorphic: true, optional: false
    belongs_to :followable, polymorphic: true, optional: false

    def self.table_name_prefix
      'followability_'
    end
  end
end
