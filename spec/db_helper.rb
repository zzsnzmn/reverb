def clear_db
	File.open("highly_scalable_database.ssv", 'w') {|file| file.write("")}
end

def create_david
	File.open("highly_scalable_database.ssv", 'w') {|file| file.write("Sutton David male cerulean 01/18/1990\n")}
end
