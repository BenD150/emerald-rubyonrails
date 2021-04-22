class TeamProject < ApplicationRecord
  belongs_to :team
  belongs_to :project

  has_many :surveys

  def comments_for_team(student)
    comments = []
      self.surveys.each do |survey|
        survey.comments.each do |c|
          comments.push(c) if c.student != student && survey.student == student
        end
      end
    comments
  end
  def scores_for_team(student)
    scores = []
      self.surveys.each do |survey|
        survey.scores.each do |s|
          scores.push(s) if s.student != student && survey.student == student
        end
      end
    scores
  end
  def comments_from_team(student)
    comments = []
      self.surveys.each do |survey|
        survey.comments.each do |c|
          comments.push(c) if c.student == student && survey.student != student
        end
      end
    comments
  end
  def scores_from_team(student)
    scores = []
      self.surveys.each do |survey|
        survey.scores.each do |s|
          scores.push(s) if s.student == student && survey.student != student
        end
      end
    scores
  end
  def comment_for_self(student)
      self.surveys.each do |survey|
        survey.comments.each do |c|
          return c if c.student == student && survey.student == student
        end
      end
  end
  def score_for_self(student)
      self.surveys.each do |survey|
        survey.scores.each do |s|
          return s if s.student == student && survey.student == student
        end
      end
  end
end
