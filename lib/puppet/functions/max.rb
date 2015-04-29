Puppet::Functions.create_function(:max) do
  def max(x, y)
    x >= y ? x : y
  end
end
