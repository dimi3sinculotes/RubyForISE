require 'Process1'

class ProcessManager

  # nil => []
  def initialize
    @list = []
  end

  # [w/e] => [w/e, process]
  def add(process)
    @list << process
  end

  # &block => [w/e].each
  def each_process(&block)
    @list.each(&block)
  end
  
  # p, &block => [w/e].each
  def each_child_process(process, &block)
    parents = [process]
    
    @list.each do |element|      
      oh_is_it = parents.any?{|par| par.id == element.parent_id}
      if oh_is_it then
        parents << element
      end
    end
    
    parents.delete(process)
    parents.each(&block)
  end
    
# ---------- Other recursive option for same function ------------------------
#
#  # p, &block => [w/e].each 
#   def each_child_process(process, &block)
#    children = []
#    first_layer = @list.find_all{|el| el.parent_id == process.id}
#      
#    first_layer.each do |element|
#      children << element
#      each_child_process2(children, @list, element)
#    end 
#    
#    children.each(&block)
#  end
#  
#  def each_child_process2 (list, all, process)
#    all.each do |element|
#      if !(list.include?(element)) && (element.parent_id == process.id) then
#        list << element
#        each_child_process2(list, all, element)
#      end
#    end
#  end
# ----------------------------------------------------------------------
  
  # nil => [t1, t2... t10]
  def top_ten
    if @list.length < 10 then
      return @list
    else
      vip_list = Array.new
      
      @list.each do |p|
        add_ordered(p, vip_list)
      end

      return vip_list
    end
  end

  # nil => hash of all p.names with the sum of their memories
  def memory
    h = Hash.new

    @list.each do |p|
      if h[p.name].nil? then
        h[p.name] = p.memory
      else
        h[p.name] += p.memory
      end
    end
    
    return h
  end
  
  # elem, [h, l] => [h, elem, l] | where l < elem < h 
  def add_ordered (elem, list)
    i = list.index{|e| e.memory < elem.memory}
    if !i.nil?
      list.insert(i, elem)
    else
      list.push(elem)
    end
    
    # List can't be larger than 10
    if list.length > 10 then
      list.pop
    end
  end 
  
  # end of ProcessManager
end
