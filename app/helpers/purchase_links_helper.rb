module PurchaseLinksHelper
  def get_url_info(url)
    og = LinkThumbnailer.generate(url)

    img = nil
    if not og.images.empty?
      img = og.images.first.src.to_s
    end

    { title: og.title, description: og.description, img: img }
  end
end
