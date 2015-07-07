class ReviewNotifier < ApplicationMailer
  default from: "reviews@example.com"

  def new_review(review)
    @review = review

    mail(
      to: review.bathroom.user.email,
      subject: "New Review for #{review.bathroom.location_name}")
  end
end
