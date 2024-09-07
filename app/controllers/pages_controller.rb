class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def send_contact_email
    @name = strong_params[:name]
    @title = strong_params[:title]
    @email = strong_params[:email]
    @message = strong_params[:message]

    if @name.present? && @title.present? && @email.present? && @message.present?
      ContactMailer.send_contact_email(@name, @title, @email, @message).deliver_now

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('contact-form', partial: 'pages/contact_success') }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('contact-form', partial: 'pages/contact_failure') }
      end
    end
  end

  def resume
    @techstack_one = ["Ruby", "Ruby On Rails (v7)", "HTML5", "CSS/SCSS", "Bootstrap", "Javascript", "Stimulus", "ActiveRecord"]
    @techstack_two = ["Git", "Github", "Test Driven Development", "Z-Shell", "Visual Studio Code", "Ubuntu", "Heroku"]
    @other = ["Python3", "SQL & PostgreSQL", "Redis", "Cloudinary", "Action Cable", "Websocket", "Figma"]
    @learning = ["React", "Redux", "Webpack", "Node.js", "AWS"]
    @bonus = ["Microsoft Office Suite", "Full Clean UK Driving Licence"]
    @bonus_left = @bonus[0]
    @bonus_right = @bonus[1]
  end

  def projects
  end

  private

  def strong_params
    params.require(:contact).permit(:name, :title, :email, :message)
  end
end
