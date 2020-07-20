Skate Spot App

User Model
has_many :reviews
has_many :spots, through: :reviews
:username
:years_skateboarding
:email
:password_digest

Spot Model
belongs_to :user
belongs_to :city
has_many :reviews
has_many :users, through :reviews
:name
:location (city, cross streets, landmark, description, etc)
:photo (NOT INCLUDED IN TABLE, just in strong params!!! Use active_storage for photo table)
:description (what's skateable here?)

Review Model
belongs_to :user
belongs_to :spot
:content
:rating_out_of_ten
:user_id
:spot_id

City Model
has_many :spots
