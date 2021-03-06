
module Pik
  
  class Implode < Command
  
    it "Removes your pik configuration."
  
    attr_reader :force
  
    def execute
      msg =  "Are you sure you want pik to implode? "
      msg << "This will remove '#{Pik.home.to_ruby}'."
      if @force || hl.agree(msg){|answer| answer.default = 'yes' }
        Pik.home.rmtree
      end
    end
    
    def command_options
      super  
      options.on("--force", "-f", "Force") do |value|
        @force = value
      end 
    end 
  
  end

end