# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find id
  # Your code Here
  @candidates.find { |candidate| candidate[:id] == id }
end

def experienced_candidate candidate
  # Your code Here
  candidate[:years_of_experience] >= 2
end

def qualified_candidates candidates
  # Your code Here
  candidates.select { |candidate|

    experienced_candidate(candidate) &&
    have_hundred_github_points_or_more(candidate) &&
    have_ruby_or_python_in_arsenal(candidate) &&
    applied_in_fifteen_days_or_more(candidate) &&
    eighteen_years_of_age(candidate)

  }
end

# More methods will go below

def have_hundred_github_points_or_more candidate
  candidate[:github_points] >= 100
end

def have_ruby_or_python_in_arsenal candidate
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end

def applied_in_fifteen_days_or_more candidate
  candidate[:date_applied] >= 15.days.ago.to_date
end

def eighteen_years_of_age candidate
  candidate[:age] >= 18
end

def ordered_by_qualification candidates
  candidates.sort_by {|candidate| [-candidate[:years_of_experience], -candidate[:github_points]]}
end
