class Banana
  def initialize(question)
    @question = question
  end

  def question_check
    @question == 'what colour is a banana'
  end

  def answer
    "yellow"
  end
end