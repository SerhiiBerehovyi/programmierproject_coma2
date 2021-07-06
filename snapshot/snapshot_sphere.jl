include("samples.jl")
include("is_visible.jl")


function snapshot_sphere(b,h,daten,m,r,dichte)
#=
generates and textures phere with center in m and radius r

:b, h: b x h size of picture to texture. Int , Int
:daten: picture to texture in RGBA format
:m: center of sphere. three-dimentional Tuple
:r: radius of phere
:dichte: number of schifted values to generate for every point. Int
        then higher the value, then longer the program will run.
=#

    # initialize result picture as 500x500 Matrix 
    pic = fill((255, 255, 255, 255), (500, 500))
    
    # reformat daten from vector to matrix
    daten = reshape(daten, (h, b))
    
    for i = 1:h
        for j = 1:b
            # generate array with shifted coordinates
            points = samples(j, i, b,h, m,r, dichte)
            
            for p in points
                if is_visible(p, m ,r)
                    xy = abbild(p)
                    # fill the pixel
                    pic[xy[1] + 250, xy[2] + 250] = daten[i,j]
                end
            end
        end
    end
    
    # reformat to 1x500^2 Matrix
    return reshape(pic, (1, 500^2))
end
