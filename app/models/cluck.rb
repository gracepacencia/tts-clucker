class Cluck
  include Mongoid::Document

  field :userid, type: String
  field :username, type: String
  field	:body, type: String
  field	:posted_date, type: String
  

  
  validates :username, :body, presence:true
  
end