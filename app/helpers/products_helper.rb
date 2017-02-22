module ProductsHelper
  def render_product_image(product)
    if product.image.present?
      link_to(image_tag(product.image.thumb.url),product_path(product), class: "thumbnail")
    else
      link_to(image_tag("http://placehold.it/200x200&text=No Image"), product_path(product),class:"thumbnail")
    end
  end
end
