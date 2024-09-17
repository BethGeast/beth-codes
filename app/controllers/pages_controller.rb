class PagesController < ApplicationController
  def home
    set_meta_tags title: "Home | BethCodes Portfolio",
                  description: "I am a full stack web developer and software engineer currently specialising in Ruby on Rails projects."
  end

  def about
    set_meta_tags title: "About Me | BethCodes Portfolio",
                  description: "Learn more about my background and who I am"
  end

  def contact
    set_meta_tags title: "Contact | BethCodes Portfolio",
                  description: "Get in touch for web development inquiries and collaboration."
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
    set_meta_tags title: "Resume | BethCodes Portfolio",
                  description: "View my full resume and which languages and technical tools I specialise in."
  end

  def projects
    set_meta_tags title: "Projects | BethCodes Portfolio",
                  description: "Explore my past web development projects, and the technical specifications of each"
  end

  private

  def strong_params
    params.require(:contact).permit(:name, :title, :email, :message)
  end
end
