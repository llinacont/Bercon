class MyDeviseController < DeviseController
    
   def build_worker(hash = nil, options = {})
    
    hash ||= resource_params || {}
    self.resource = resource_class.new(hash)
    
  end
  
  
end
