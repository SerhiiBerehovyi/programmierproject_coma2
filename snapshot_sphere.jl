include("samples.jl")
include("is_visible.jl")


function snapshot_sphere(b,h,daten,m,r,dichte)
    pic = initial_pic()
    
    points = []
    for i=1:h
        for j=1:b
            p = samples(j,i, b,h, m, r, dichte)
            if is_visible(p, m ,r)
                camera = abbild(p)
                x = camera[1] + 249
                y = camera[2] + 249
                pic[x][y] = daten[i][j]
            end
        end
    end    
end

function initial_pic()
    pic = []
    for i=1:500
        row = []
        for j=1:500
            push!(row, [0,0,0])
        end
        push!(pic, row)
    end
    return pic
end


