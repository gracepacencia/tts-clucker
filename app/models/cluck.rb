class Cluck
  include Mongoid::Document

  field :userid, type: String
  field :username, type: String
  field	:body, type: String
  field	:posted_date, type: String
  

  index({starred: 1})
  validates :userid, presence:true
  
end