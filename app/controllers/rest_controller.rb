class RestController < ApplicationController
  
  def login
    if form_params[:email] && form_params[:image]
      response_request(params[:email],params[:image])
    end
  end

  private

  def response_request(image, email)
    url =  "https://frozen-headland-19727.herokuapp.com/rest/verify_user"
    uri = URI(url)
    res = Net::HTTP.post_form(uri, email: params[:email], image: params[:image])
    if res.code == "200" && res.message == "OK"
        redirect("OK")
    elsif res.code == "401" && res.message == "No Autorizado"
        redirect("No logueado")
    else
        redirect("Error #{res.code}")
    end
  end

  def redirect (mensaje)
    redirect_to login_users_path, notice: mensaje
  end

  def form_params
    params.permit(:email,:image,:utf8,:authenticity_token,:commit)
  end
end
