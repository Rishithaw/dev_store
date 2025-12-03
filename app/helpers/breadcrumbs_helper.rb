module BreadcrumbsHelper
  def build_breadcrumbs
    crumbs = []
    crumbs << { name: "Home", path: root_path }

    if controller_name == "products" && action_name == "index"
      crumbs << { name: "Products", path: products_path }

      if params[:search_category_id].present?
        category = Category.find(params[:search_category_id])
        crumbs << { name: category.name, path: products_path(search_category_id: category.id) }
      end
    end

    if controller_name == "products" && action_name == "show"
      product = @product
      category = product.category

      crumbs << { name: "Products", path: products_path }
      crumbs << { name: category.name, path: products_path(search_category_id: category.id) } if category
      crumbs << { name: product.name, path: product_path(product) }
    end

    crumbs
  end
end
