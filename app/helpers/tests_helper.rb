module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :easy, 2 => :medium, 3 => :medium, 4 => :medium }.freeze
  
  def test_level(test)
    TEST_LEVELS[test.level] || :hard
  end

  def test_category(test)
    test.category&.title
  end
end
