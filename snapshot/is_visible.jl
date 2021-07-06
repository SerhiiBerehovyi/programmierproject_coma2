include("abbild.jl")

function is_visible(p,m,r)
#=
checks if point is visible for camera and if vector [0, p] has an intersection
with sphere.
:p: point to check on visibility, is represented as a three-dimentional Tuple
:m: center of phere. three-dimentional Tuple
:t: radius of phere. Int

:return: true if point in plane of camera is and vector [0,p] has no/only one intersection
    with phere.
=#
    # check if point is visible for camera
    cpoint = abbild(p)
    if isnothing(cpoint)
        return false
    end
    
    # check if ray has intersactions with phere 
    a = p[1]^2 + p[2]^2 + p[3]^2
    b = -2 * (p[1] * m[1] + p[2] * m[2] + p[3] * m[3])
    c = m[1]^2 + m[2]^2 + m[3]^2 - r^2
    
    disc = b^2 - 4*a*c
    # there is no or only one intersections
    if disc <= 0
        return true
    end 
    
    # there are two intersections
    # need to check that point p <= s1 < s2
    s1 = (-b + sqrt(disc)) / (2*a)
    s2 = (-b - sqrt(disc)) / (2*a)
    
    if p[3] <= p[3]*min(s1,s2)
        return true
    else
        return false
    end 
end

#println(is_visible((1,2,3), (10,10,10), 10))
#println(is_visible((0,0,300), (0,0,260), 10))
#println(is_visible((0,0,300), (0,0,400), 10))
#println(is_visible((0,0,270), (0,0,400), 10))
#println(is_visible((0,0,270), (0,0,270), 10))
#println(is_visible((0,0,290), (0,0,270), 10))
