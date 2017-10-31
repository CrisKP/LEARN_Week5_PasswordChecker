class PasswordController < ApplicationController
  def check
    if params.has_key?(:userid) && !params[:userid].strip.empty?
      cookies[:userid] = params[:userid]
      @userid = params[:userid]
    end
    if params.has_key?(:password) && !params[:password].strip.empty?
      cookies[:password] = params[:password]
      @password = params[:password]
    end
    if @userid == @password
      flash.now[:alert] = "Userid and Password cannot be the same"
    elsif @userid.length < 6 && @password.length < 6
      flash.now[:alert] = "UserId and Password need to be greater than 6 characters"
    elsif (@userid.include? "!") || (@userid.include? "$") || (@userid.include? "#")
      flash.now[:alert] = "UserId cannot contain '$', '#', '!'"
    elsif (!@password.include? "!") && (!@password.include? "$") && (!@password.include? "#")
      flash.now[:alert] = "Password has to include '$', '#', '!'"
    else
      flash.now[:success] = "Userid and Password are valid"
    end
  end
end
