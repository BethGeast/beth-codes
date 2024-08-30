class PagesController < ApplicationController
  def home
  end

  def about
    # @hobbies = ["Dogs", "Video Gaming", "Music (Listening, Live & Performing)", "Puzzles"]
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
    @techstack = ["Ruby", "Ruby On Rails", "HTML5", "CSS/SCSS", "Javascript", "Git", "Github", "TDD", "Z-Shell", "Visual Studio Code", "Ubuntu"]
    @other = ["Python", "SQL & PostgreSQL", "Heroku", "Stimulus", "Bootstrap", "Redis", "Cloudinary", "Action Cable", "Websocket", "Figma"]
    @learning = ["React", "Redux", "Webpack"]
    @additional = ["Full Clean UK Driving Licence", "Microsoft Office"]
    @strengths = ["Trustworthy & Reliable", "Empathetic & Approachable", "Fast Learner", "Dedicated", "Strong Listener", "Team Player", "Organisation"]
  end

  def projects
  end

  private

  def strong_params
    params.require(:contact).permit(:name, :title, :email, :message)
  end
end
