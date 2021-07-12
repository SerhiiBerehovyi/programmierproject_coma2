function samples(x,y,b,h,m,r,dichte)
#=
generate a list with coordinates of phere
to avoid noises on image we use a shifting of point (x,y)
supposed, that random() returns values with normal distribulions 
of values

:x, y: coordinates of point on picture. three-dimentional Tuples
:b, h: b x h size of picture to texture. Int, Int
:m: coordinates of center of sphere. three-dimentional Tuple
:r: radius of sphere. Int
:dichte: number of schifted values to generate for point (x,y). Int
        then higher the value, then longer the program will run. 
=#

    # initialise the Array
    points = Array{Tuple{Float64, Float64, Float64}}(undef, dichte)
    
    # fill this array
    for i=1:dichte
        # generate random Tuple{Float64, Ploat64}
        # needed for shifting of pixel (x,y)
        p = map(rand, (Float64, Float64))

        theta = (x + p[1]) / h * pi
        phi = (y + p[2]) / b  * 2 * pi
        
        dx = m[1] + r * sin(theta) * cos(phi)
        dy = m[2] + r * sin(theta) * sin(phi)
        dz = m[3] + r * cos(theta)
        
        points[i] = (dx,dy,dz)
    end

    return points
    
end
