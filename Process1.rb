class Process1
  # Notice the 1 in the Process1, it's not relevant, but, dunno why Eclipse don't want
  # to reconize just Process as a class, ask someone else lol
  
  # id, parent_id, name, memory => /id, parent_id, name, memory/
  def initialize (id, parent_id, name, memory)
    @id, @parent_id, @name, @memory = id, parent_id, name, memory
  end

  # So atributes are accesible from outside
  attr_reader :id, :parent_id, :memory, :name

  # nil => String representing self
  def to_s
    return @name + ', ' + @id.to_s + ', ' + @parent_id.to_s + ', ' + @memory.to_s 
  end
end
