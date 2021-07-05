from PIL import Image
import numpy as np
from julia import Julia
from julia import Main


def main():
    image = []
    b = 0
    h = 0
    with Image.open("space.png") as im:
        image = np.array(im)
        image = image.tolist()
        print(image)
        b, h = im.size
    
    Main.include("snapshot_sphere.jl")   
    #jl = Julia()
    #jl.eval("snapshot_sphere.jl")
    #new_image = Main.snapshot_sphere(b,h,image,(0,0,300),20, 1)
    
    #ni = np.array(new_image)
    #im = Image.fromarray(ni, "RGB")
    #im.show()
    
if __name__ == "__main__":
    main()
    
