numbers = Channel.from(1..100)
numbers1 = Channel.from(101..200)
numbers2 = Channel.from(201..300)

process test {
  input:
  val(number) from numbers

  output:
  stdout into debug

  """
sleep 10
echo -n 'Hi there,' ${number}
"""
}

process test1 {
  input:
  val(number) from numbers1

  output:
  stdout into debug1

  """
sleep 10
echo -n 'Hi there,' ${number}
"""
}

process test2 {
  input:
  val(number) from numbers2

  output:
  stdout into debug2

  """
sleep 10
echo -n 'Hi there,' ${number}
"""
}

debug.println()
debug1.println()
debug2.println()
