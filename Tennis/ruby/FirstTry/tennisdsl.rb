def player args
  method = "player#{args[:player]}_wins"
  args[:n].times { @tennis.send method.to_sym, 1 }
end

def one n
  { :player => "1", :n => n }
end

def two n 
  { :player => "2", :n => n }
end

def wins n
  n
end