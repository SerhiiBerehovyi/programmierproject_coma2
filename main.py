from PIL import Image
from julia import Main
from re import findall


def main():
    # get input data from user
    name, center, radius, density = get_data()
    
    #read image
    with Image.open(name) as img:
        if img.mode != 'RGBA':
            img.putalpha(255)
        image = list(img.getdata())
        b, h = img.size
    
    # include julia file
    Main.include("snapshot/snapshot_sphere.jl")
    print("\033[32m{}".format("please wait..."))
    
    result = Main.snapshot_sphere(b, h, image, center, radius, density)


    img = Image.new(mode='RGBA', size=(500, 500))

    # Add data to image and save the PNG.
    # result is a list of a list, we take just the 0-th entry.
    img.putdata(result[0])
    img.save('result.png')
    
    print("Image saved!")


def get_data():
    """
        gets data from user and/or sets default values for fields
        
        @return a tuple (name, center, radius, density)
    """
    
    # default values
    name = "tokio.png"
    center = (0,0,450)
    radius = 200
    density = 10
    
    print("Default input data:\nname = \"tokio.png\", center = (0,0,450), radius = 200, density = 10\nWould you like to change them?")
    
    # enter custom values
    choise = input("y or n: ")
    if choise.lower() == "y":
        print("Enter to use default value")
        name    = get_field("Enter the name of picture: ", "tokio.png")
        
        center  = get_field("Enter coordinates of center of sphere (\"(0,0,450)\" or \"0,0,450\"): ",
                            "(0,0,450)")
        center = tuple([int(x) for x in findall('-?\d+', center)])
        
        radius  = int(get_field("Enter radius: ", 200))
        density = int(get_field("Enter density: ", 10))
        
    return name, center, radius, density


def get_field(msg, default):
    """
        gets separate field from user
        
        @msg message for user
        @default data that wil be returned if user didnt enter data
        
        @return users data or default
    """
    field = input(msg)
    if field == "":
        field = default
    return field

if __name__ == "__main__":
    main()
