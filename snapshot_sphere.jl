include("samples.jl")
include("is_visible.jl")


function snapshot_sphere(b,h,daten,m,r,dichte)
    pic = initial_pic()
    
    sphere = []
    for i=1:h
        for j=1:b
            p = samlpes(j,i, b,h,dichte)
            if is_visible(p, m ,r)
                camera = abbild(p)
                pic[camera[1]][camera[2]] = daten[i][j]
            end
        end
    end    
end

function initial_pic()
    pic = []
    for i=1:500
        row = []
        for j=1:500
            push!(row, (0,0,0))
        end
        push!(pic, row)
    end
    return pic
end
