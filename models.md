models:

Users SORCERY
- has_many :listings
- has_many :comments
- has_many :comments, through: :listings
* admin permissions for certain users


Listings:
- belongs_to :user
- has_many :comments


Comments
- belongs_to :user
- belongs_to :listing
- polymorphic

Tags
- belongs_to :users
- belongs_to :listings
- polymorphic

gems:
- sorcery
- cancancan
- activeadmin?
- activate?
- acts as taggable
- carrierwave => upload photos
