ActiveAdmin.register Product do
  permit_params :name, :body_description, :price, :category_id, :image, size_ids: []
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :sizes do |product|
      product.sizes.map(&:name).join(', ')
    end
    column :image do |product|
      if product.image.attached?
        image_tag url_for(product.image), size: "50x50"
      end
    end
    actions
  end

  filter :name
  filter :body_description
  filter :price
  filter :category
  filter :sizes, as: :select, collection: -> { Size.all.map { |s| [s.name, s.id] } }

  form do |f|
    f.inputs do
      f.input :name
      f.input :body_description
      f.input :price
      f.input :category
      f.input :sizes, as: :check_boxes, collection: Size.all.map { |s| [s.name, s.id] }
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :body_description
      row :price
      row :category
      row :sizes do |product|
        product.sizes.map(&:name).join(', ')
      end
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), size: "50x50"
        end
      end
    end
  end
end
