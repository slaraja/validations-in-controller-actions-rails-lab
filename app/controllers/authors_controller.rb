class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  # def create
  #   @author = Author.create!(author_params)

  #   redirect_to author_path(@author)
  # end

  def create
    # Create a brand new, unsaved, not-yet-validated Post object from the form.
    @author = Author.new(author_params)

    # Run the validations WITHOUT attempting to save to the database, returning
    # true if the Post is valid, and false if it's not.
    if @author.valid?
      # If--and only if--the post is valid, do what we usually do.
      @author.save
      # This returns a status_code of 302, which instructs the browser to
      # perform a NEW REQUEST! (AKA: throw @post away and let the show action
      # worry about re-reading it from the database)
      redirect_to author_path(@author)
    else
      # If the post is invalid, hold on to @post, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :new
    end
  end


  private

  def author_params
    params.permit(:email, :name)
  end
end
