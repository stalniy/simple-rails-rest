# app/admin/products.rb
ActiveAdmin.register User do

  # Create sections on the index screen
  scope :all, default: true
  # scope :available
  # scope :drafts

  # Filterable attributes on the index screen
  filter :email
  # filter :author, as: :select, collection: ->{ U.authors }
  filter :role
  # filter :price
  filter :created_at
  filter :updated_at

  # Customize columns displayed on the index screen in the table
  index do
    column :email
    column :role
    column :created_at
    column :updated_at
    actions
  end
end
