class PagesController < ApplicationController
  def home
  end

  def about
    # @hobbies = ["Dogs", "Video Gaming", "Music (Listening, Live & Performing)", "Puzzles"]
  end

  def contact
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
end
