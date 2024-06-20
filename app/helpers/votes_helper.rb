module VotesHelper
  def vote_choice(vote)
    case vote.choice
    when "yes"
      tag.span "Yes", class: "badge bg-danger"
    when "no"
      tag.span "No", class: "badge bg-success"
    when "abstain"
      tag.span "Abstain", class: "badge bg-warning"
    end
  end
end
