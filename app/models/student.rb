class Student < ApplicationRecord
    has_one :user

    has_many :student_teams
    has_many :teams, through: :student_teams

    has_many :team_projects, through: :teams
    has_many :projects, through: :team_projects

    has_many :surveys, through: :projects

    has_many :comments, through: :surveys
    has_many :scores, through: :surveys

    def comments_by()
        comments = []
        self.comments.each do |c|
            comments.push(c) if c.written_for != self
        end
        comments
    end
    def scores_by()
        scores = []
        self.scores.each do |s|
            scores.push(s) if s.written_for != self
        end
        scores
    end
    def comments_for()
        comments = []
        self.comments.each do |c|
            comments.push(c) if c.written_for == self
        end
        comments
    end
    def scores_for()
        scores = []
        self.scores.each do |s|
            scores.push(s) if s.written_for == self
        end
        scores
    end
end
