f = File.new("data.csv", "r")
hicps = f.readlines
f.close

sum = 0
count = 0
hicps.each do |hicp|
	sum = sum + hicp.split(",")[1].to_f
	count = count + 1
end
mean = sum/count

sum_variance = 0
hicps.each do |hicp|
	hicp = hicp.split(",")[1].to_f
	variance = (hicp - mean)**2
	sum_variance += variance
end
standard_deviation = (sum_variance/count)**0.5
z_score = 0
z_scores = []
hicps.each do |hicp|
	hicp = hicp.split(",")[1].to_f
	z_score = (hicp - mean)/standard_deviation
	z_scores.push z_score	
end
z_score_file = File.new("z_scores.csv", "w")
z_score_file.write z_scores.to_s # join(",")
z_score_file.close

puts "The sum of your values is #{sum}"
puts "You have #{count} data points"
puts "The average is #{mean}"
puts "The total of all the variances is #{sum_variance}"
puts "You standard deviation is #{standard_deviation}"
puts "Your z_score is #{z_score}"
puts "Your data has been stored in a file called 'z_scores.csv'"
