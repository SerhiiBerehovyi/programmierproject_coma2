from PIL import Image
import numpy as np
from julia import Julia



def main():
    image = []
    b = 0
    h = 0
    with Image.open("space.png") as im:
        image = np.array(im)
        b, h = im.size
        
    for i in len(image):
        for j in len(image[i]):
            image[i][j] = tuple(image[i][j])
    
    jl = Julia()
    jl.include("snapshot_shere.jl")
    new_image = jl.snapshot_sphere(b,h,image,(0,0,300),20, 1)
    im = Image.fromarray(new_image, "RGB")
    im.show()
    
if __name__ == "__main__":
    main()
    
