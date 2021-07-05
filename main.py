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
        b, h = im.size
        
    im = []
    for i in range(len(image)):
        for j in range(len(image)):
            im.append(image[i][j])
            
    Main.include("snapshot_sphere.jl")
    new_image = Main.snapshot_sphere(b,h,im,(0,0,300),50, 1)
    
    ni = np.array(new_image)
    im = Image.fromarray(np.uint8(ni)).convert("RGB")
    im.show()
    
    
    
if __name__ == "__main__":
    main()
    
