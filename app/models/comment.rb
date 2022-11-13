class Comment < ActiveRecord::Base
    belongs_to :manager
    belongs_to :report
end
