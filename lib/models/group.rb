class Group < Array
  def values
    map(&:value).compact
  end

  def possible_values
    (1..9).to_a - values
  end

  def inspect
    map(&:inspect).join(', ')
  end
end
