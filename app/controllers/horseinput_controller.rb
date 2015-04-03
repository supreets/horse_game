class HorseinputController < ApplicationController
    
    def new
    end
    
    def create
    bundles = params[:bundles].to_i
    distance = params[:distance].to_i
    bundlesperkm = params[:bundlesperkm].to_i
    bundlesperride = params[:bundlesperride].to_i
    
    d = 0
    while d < distance
     if bundles <= 0
       break;
     end
     l = (((bundles/bundlesperride)*2 -1) * bundlesperkm)
     distanceleft = distance - d
     if bundles % bundlesperride <= (2*bundlesperkm)
       bundles -= (bundles % bundlesperride)
     end
     kilometerspossible = bundlesperride/l
     d1 = distanceleft < kilometerspossible ? distanceleft : kilometerspossible
     d += d1
     bundles -= (d1 * l)
    end
   
     @result = bundles>0 ? bundles : "bundles exhausted before completing distance"
    end
end
