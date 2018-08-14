class Question
  attr_reader :num1, :num2, :question,:answer

  def initialize
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    @question = "Whad does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end
end
