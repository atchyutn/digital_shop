module ProductsHelper
  def fetch_product_img
    img_arr = ["https://images-eu.ssl-images-amazon.com/images/I/51bwFsBc0TL._SY346_.jpg", 
      "https://images-na.ssl-images-amazon.com/images/I/61zR1dZFrzL._SL1500_.jpg", 
      "https://m.media-amazon.com/images/I/71X1ipYOLbL._AC_UY436_FMwebp_QL70_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71yVflZyOYL._SL1500_.jpg"
    ]

    return img_arr.random
  end
