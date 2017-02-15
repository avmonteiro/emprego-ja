class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs

    if @jobs.empty?
      flash[:empty] = "Nenhuma vaga disponível"
    end
  end

end
