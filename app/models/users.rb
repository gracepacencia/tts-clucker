class Users
  include Mongoid::Document

  index({starred:1})

  field :fname, type: String
  field :lname, type: String
  field	:email, type: String
  field	:pword, type: String
  
end
