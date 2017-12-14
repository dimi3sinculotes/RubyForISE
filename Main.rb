require 'ProcessManager'
require 'Process1'

# Main

pm = ProcessManager.new

# Notice the 1 in the Process1, it's not relevant, but, dunno why Eclipse don't want
# to reconize just Process as a class, ask someone else lol

p1 = Process1.new(1, 0,'init',450)
p2 = Process1.new(2, 1, 'chrome',2100)
p3 = Process1.new(5, 2, 'chrome', 1230)
p4 = Process1.new(3, 1, 'HeroesOfMightAndMagicV', 14000)
p5 = Process1.new(4, 1, 'firefoxIsBetter', 10)
p6 = Process1.new(6, 1, 'Excel', 2500)
p7 = Process1.new(7, 1, 'Word', 500)
p8 = Process1.new(8, 6, 'RubyMine', 1111)
p9 = Process1.new(9, 7, 'firefoxIsBetter', 30)
p10 = Process1.new(10, 8, 'Excel', 3200)
p11 = Process1.new(11, 10, 'HeroesOfMightAndMagicV', 60000)
p12 = Process1.new(12, 1, 'firefoxIsBetter', 50)
p13 = Process1.new(13, 6, 'Word', 90)
p14 = Process1.new(14, 13, 'Word', 80)
p15 = Process1.new(15, 13, 'firefoxIsBetter', 25)
p16 = Process1.new(16, 13, 'cheatEngine', 1100)

# Add all the Process1 objects to ProcessManager's list
pm.add(p1); pm.add(p2); pm.add(p3); pm.add(p4); pm.add(p5); pm.add(p6); pm.add(p7); pm.add(p8)
pm.add(p9); pm.add(p10); pm.add(p11); pm.add(p12); pm.add(p13); pm.add(p14); pm.add(p15); pm.add(p16)

# Testing
puts 'The following, are all the processes that the system is running:'; puts 
pm.each_process(){|p| puts p}

puts
puts "-----------------------------------------------------------------------"

puts 'These ones are [' + p1.to_s + ']\'s children:'; puts 
pm.each_child_process(p1) {|p| puts p}

puts
puts "-----------------------------------------------------------------------"

puts 'These ones are [' + p13.to_s + ']\'s children:'; puts 
pm.each_child_process(p13) {|p| puts p}

puts
puts "-----------------------------------------------------------------------"

puts 'Now, we will see the Top10 most memory expensive processes beeing runed atm:'; puts 
puts pm.top_ten()

puts
puts "-----------------------------------------------------------------------"

puts 'This represents the TOTAL memory used by EACH KIND of process:'; puts 
puts pm.memory()
