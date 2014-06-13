class Pledge < ActiveRecord::Base
  belongs_to :donor
  belongs_to :campaign
  belongs_to :donated_item, class_name: "Item"
end
