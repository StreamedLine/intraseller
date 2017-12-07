create a bullets table
	create comparison table. should have nested url, items/1/comparisons
	
	coparisons
	generate join table called comparisons
		item_id, compared_id

	Comparison
	belongs_to item
	belongs_to :compared, :class_name => :item
	item
  has_many comparisons,
  has_many :compared, :thorugh => comparisons, 
	has_many :inverse_comparisons, :class_name => comparison, :foreign_key => item_id
	has_many :inverse_compared, :through => inverse_comparisons, :source => :item

	bullets are votable

todo
deal with tags and votes
	answers are votable

add search
make time/dates look nicer

make views look nice