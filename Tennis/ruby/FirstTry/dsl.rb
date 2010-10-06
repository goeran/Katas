module Dsl
  def build_method    
    method = ""
    @methods.reverse.each { |v| method += v.to_s + "_" }
    method.gsub! /_$/, ""
  end
  
  def method_missing method, *args
    @methods = [] if @methods == nil
    @methods.push method
    method_to_call = build_method
    if self.methods.include? method_to_call then
      @methods.clear
      return self.send method_to_call, args.flatten[0]
    end
    args
  end
end