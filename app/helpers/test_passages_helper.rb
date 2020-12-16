module TestPassagesHelper
  RESULT = { failed: { style: :notice_red, message: "You didn't pass the test" }, passed: { style: :notice, message: 'Test was successfully passed' } }.freeze

  def result(test_passage)
    test_passage.is_passed? ? RESULT[:passed] : RESULT[:failed]
  end
end
