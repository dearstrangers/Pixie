class CollectionController < ApplicationController
  layout 'collection'
  def index
  	 @new_garments = Garment.order({created_at: :desc}).limit(12)
  end
end
