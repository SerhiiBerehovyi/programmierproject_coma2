function samples(x,y,b,h,m,r,dichte)
    points = Array{Tuple{Float64, Float64, Float64}}(undef, dichte)
    for i=1:dichte        
        theta = (x + rand()) / b * pi
        phi = (y + rand()) / h  * 2 * pi
        
        dx = m[1] + r*sin(theta)*cos(phi)
        dy = m[2] + r*sin(theta)*sin(phi)
        dz = m[3] + r*cos(theta)
        
        points[i] = (dx,dy,dz)
    end

    return points
    
end
