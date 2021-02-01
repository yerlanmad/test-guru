module TestPassagesHelper
  RESULT = { failed: { style: :notice_red, message: 'fail' }, passed: { style: :notice, message: 'pass' } }.freeze

  def result(is_passed)
    is_passed ? RESULT[:passed] : RESULT[:failed]
  end
end
