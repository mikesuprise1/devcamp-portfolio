class Skill < ApplicationRecord
	valedates_presence_of :title, :percent_utilized
end
