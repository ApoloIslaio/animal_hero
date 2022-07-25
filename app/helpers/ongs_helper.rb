module OngsHelper
  def renderImg(src)

    if src != ''
      image_tag src, size: "60x65" 
    else 
      'Não informado.' 
    end 

  end
end
