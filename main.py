from PIL import Image
import numpy as np
from julia import Julia
from julia import Main



def main():
    with Image.open("2.png") as img:
        if img.mode != 'RGBA':
            img.putalpha(255)
        image = list(img.getdata())
        b, h = img.size

    Main.include("snapshot_sphere.jl")
    result = Main.snapshot_sphere(b, h, image, (0, 0, 270), 200.0, 10)

    img = Image.new(mode='RGBA', size=(500, 500))

    # Add data to image and save the PNG.
    # result is a list of a list, we take just the 0-th entry.
    img.putdata(result[0])
    img.save('result.png')
    
    img.show()


if __name__ == "__main__":
    #PngSphere()
    main()
