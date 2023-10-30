import os
from PIL import Image
import imageio

def create_gif(input_folder, output_gif):
    # Get a list of all image files in the folder
    image_files = [f for f in os.listdir(input_folder) if os.path.isfile(os.path.join(input_folder, f))]
    image_files = [f for f in image_files if f.lower().endswith(('.png'))]

    # Sort the images to maintain order
    image_files.sort()

    # Open and convert each image to RGB mode
    images = []
    for image_file in image_files:
        with Image.open(os.path.join(input_folder, image_file)) as img:
            img = img.convert('RGBA')
            images.append(img)

    # Save as GIF using imageio
    imageio.mimsave(output_gif, images, format='GIF', duration=0.5)  # Adjust duration as needed

# Usage
input_folder = "C:/Users/dk4770/Downloads/a"
output_gif = "Zgate.gif"

create_gif(input_folder, output_gif)
