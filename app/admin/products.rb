ActiveAdmin.register Product do
  permit_params :name, :category, :price, :quantity, size_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :price
    column :quantity
    actions
  end

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :category, as: :select, collection: ['Male', 'Female', 'Kid','Any']
      f.input :price
      f.input :quantity
      f.input :sizes, as: :check_boxes, collection: Size.all.map { |s| [s.name, s.id] }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :category
      row :price
      row :quantity
      row :sizes do |product|
        product.sizes.map(&:name).join(', ')
      end
    end
    active_admin_comments
  end
end
