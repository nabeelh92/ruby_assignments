def fibs(n)
  return 0 if n == 0
  return 1 if n == 1 
  return fibs(n-1) + fibs(n-2)
end

puts fibs(9)