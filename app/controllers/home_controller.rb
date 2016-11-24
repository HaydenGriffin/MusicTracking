class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def request_contact
		name = params[:name]
		email = params[:email]
		telephone = params[:telephone]
		message = params[:message]

		if name.blank?
			flash[:danger] = I18n.t('home.request_contact.no_name')
		elsif email.blank?
			flash[:danger] = I18n.t('home.request_contact.no_email')
		elsif telephone.blank?
			flash[:danger] = I18n.t('home.request_contact.no_number')
		elsif message.blank?
			flash[:danger] = I18n.t('home.request_contact.no_message')
		else
		  ContactMailer.contact_email(email, name, telephone, message).deliver_now
		  flash[:success] = "Thank you. We will be in touch shortly."
		end
		redirect_to contact_path
	end
end