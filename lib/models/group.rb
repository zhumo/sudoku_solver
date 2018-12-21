class Group < Array
  def values
    map(&:value).compact.uniq
  end

  def inspect
    map(&:inspect).join(', ')
  end
end
