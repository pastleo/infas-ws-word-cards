class MemorizingController < ApplicationController

  def start
    @group = params['group']
    Word.where(group: @group).update_all(visited: false)
  end

  def continue
    @group = params['group']
    @word = Word.where(group: @group, visited: false).order("RANDOM()").first
    if @word.present?
      @word.visited = true
      @word.save
    else
      redirect_to words_path, notice: "memorizing #{@group} finished!"
    end
  end

  def answer
    @group = params['group']
    @word = Word.find(params['word_id'])
  end
end
