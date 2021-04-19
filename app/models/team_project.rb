class TeamProject < ApplicationRecord
  belongs_to :team
  belongs_to :project

  has_many :surveys

  def comments_by(student)
    comments = []
      self.surveys.comments.each do |c|
        comments.push(c) if c.student != student
      end
      comments
  end
  def scores_by(student)
    scores = []
      self.surveys.scores.each do |s|
        scores.push(s) if s.student != student
      end
      scores
  end
  def comments_for(student)
    comments = []
      self.surveys.comments.each do |c|
        comments.push(c) if c.student == student
      end
      comments
  end
  def scores_for(student)
    scores = []
      self.surveys.scores.each do |s|
        scores.push(s) if s.student == student
      end
      scores
  end
end
