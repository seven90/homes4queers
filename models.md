models:

Users SORCERY
- has_many :listings
- has_many :comments, as: commentable
- has_many :comments, through: :listings
- has_many :pictures, as: :imageable
- has_many :tags, as: :taggable
* admin permissions for certain users


Listings:
- belongs_to :user
- has_many :comments, as: commentable
- has_many :images, as: :imageable
- has_many :tags, as: :taggable


Comments
- belongs_to :commentable, polymorphic => true

Tags
- belongs_to :taggable, polymorphic => true

Pictures
- belongs_to :imageable polymorphic => true


gems:
- sorcery
- cancancan
- activeadmin?
- activate?
- acts as taggable
- carrierwave => upload photos
