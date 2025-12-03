ActiveAdmin.register Page do
  permit_params :title, :slug, :content

  form do |f|
    f.inputs "Page Content" do
      f.input :title
      f.input :slug, input_html: { disabled: true }
      f.input :content, as: :text, input_html: { rows: 15 }
    end
    f.actions
  end
end
