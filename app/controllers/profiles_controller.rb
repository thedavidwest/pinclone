class ProfilesController < ApplicationController
  def show
      @user = User.find_by_name(params[:id])
      if @user
        @pins = @user.pins.all
        render action: :show
      else
        render file: 'public/404', status: 404, formats: [:html]
    end
  end
end
