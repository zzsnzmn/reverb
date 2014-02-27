def clear_db(tmp)
  File.open(tmp, 'w') {|file| file.write("")}
end

def create_tmp(tmp)
  File.open(tmp, 'w') {|file| file.write("Sutton David male cerulean 01/18/1990\n")}
end
