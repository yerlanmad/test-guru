module TestPassagesHelper
  RESULT = { failed: { style: :notice_red, message: "You didn't pass the test" }, passed: { style: :notice, message: 'Test was successfully passed' } }.freeze

  def result(rate)
    if rate < 85
      RESULT[:failed]
    else
      RESULT[:passed]
    end
  end
end
