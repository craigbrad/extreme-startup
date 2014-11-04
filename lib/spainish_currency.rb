class SpanishCurrency
  def initialize(question)
    @question = question
  end

  def question_check
    @question == 'what currency did Spain use before the Euro'
  end

  def answer
    "Peseta"
  end
end