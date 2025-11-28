ActiveAdmin.register Product do
  permit_params :name, :description, :base_price, :category_id, :product_type, :stock_quantity, :on_sale, :sale_price, :featured,
                :digital_file_url,
                :digital_file_size

  filter :name
  filter :category
  filter :product_type
  filter :on_sale
  filter :featured
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :base_price
    column :product_type
    column :category
    column :stock_quantity, sortable: :stock_quantity
    column :on_sale
    column :featured
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :base_price
      row :category
      row :product_type
      row :stock_quantity
      row :on_sale
      row :sale_price
      row :featured
      row :digital_file_url
      row :digital_file_size
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :base_price
      f.input :category
      f.input :product_type,
              as: :select,
              collection: ["physical", "digital"],
              input_html: { id: "product_type_select" }


      f.input :stock_quantity, wrapper_html: { id: "stock_quantity_field" }

      f.input :on_sale
      f.input :sale_price
      f.input :featured

      f.input :digital_file_url, wrapper_html: { id: "digital_file_url_field" }
      f.input :digital_file_size, wrapper_html: { id: "digital_file_size_field" }
    end

    f.actions
  end

  config.clear_sidebar_sections!

  sidebar :help, only: [:new, :edit] do
    script do
      raw <<-JS
        document.addEventListener("DOMContentLoaded", function() {
          function toggleFields() {
            var type = document.querySelector("#product_type_select").value;

            document.querySelector("#stock_quantity_field").style.display =
              type === "physical" ? "block" : "none";

            document.querySelector("#digital_file_url_field").style.display =
              type === "digital" ? "block" : "none";
            document.querySelector("#digital_file_size_field").style.display =
              type === "digital" ? "block" : "none";
          }

          toggleFields();

          document
            .querySelector("#product_type_select")
            .addEventListener("change", toggleFields);
        });
      JS
    end
  end
end
