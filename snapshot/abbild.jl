function abbild(p)
#=
finds an intersection of vector p with plane of camera 

:p: Tuple{Int, Int, Int}. vector [0,p], where p = (x,y,z)
:returns: returns a Tuple{Int, Int} with coordinates of intersection OR Nothing, if there is no one
=#
    if p[3] < 250
        return nothing
    end
    
    #= 
     camera plane is parallel to xOy,so A and B in General 
     equation of the plane are equal 0   
     for three points (0,0,250), (-1,1,250) and (1,1,250) 
     equation is -2z + 500 = 0 <=> z - 250 = 0
     t = - (Cz_0 + D)/C(z_p - z_0) => .. 
    =#
    t = 250/p[3]
    
    # if t is not in 0..1, there is no intersection with plane 
    #if t < 0 || t > 1
    #    return nothing
    #end
    
    x = t*p[1]
    y = t*p[2]
    
    if (-250 <= x < 250) && (-250 <= y < 250)
        return (Int(floor(x)), Int(floor(y)))
    end
    return nothing
end

#println(abbild((1,2,3)))
#println(abbild((148, 92, 410)))
#println(abbild((-75, -250, 820)))
#println(abbild((800, 100, 300)))

