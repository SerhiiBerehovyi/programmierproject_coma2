include("samples.jl")
include("is_visible.jl")


function snapshot_sphere(b,h,daten,m,r,dichte)
    pic = fill((255, 255, 255, 255), (500, 500))
    
    daten = reshape(daten, (h, b))
    
    for i = 1:h
        for j = 1:b
            points = samples(j, i, b,h, m,r, dichte)
            
            for p in points
                if is_visible(p, m ,r)
                    xy = abbild(p)
                    pic[(-1) * xy[2] + 250, (-1) * xy[1] + 250] = daten[i,j]
                end
            end
        end
    end
    
    return reshape(pic, (1, 500^2))
end
