import torch
import torchvision.transforms as transform
from pIL import image


model_path = 'mnt/data/Group 41.ipynb'

trained_model = torch.load(model_path)
trained_model.eval()


def generate_caption(image, model):
    preprocess = transforms.Compose([
        transdorms.Resize(256),
        transforms.Centercrop(224),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.485,0.456, 0.406], std =[0.229, 0.244, 0.225])
        ])
    img_tensor = preprocess(image).unsqueeze(0)
    
    with torch.no_grad():
        caption = model(image_tentor)
    return caption


from gtts import gTTS
import os
import platfrom

def text_to_speech(text):
    tts = gTTs(text=text, lang='en')
    tts.save('output.mp3')
    
    if platform.system()== 'Linux':
        os.system("mpg321 output.mp3")
    elif platform.system() == "Windows":
        from playsound import playsound
        playsound("output.mp3")
    elif platform.system() == "Darwin":
        os.system("afplay output.mp3")
    

import streamlit as st

st.title("Image Captioning and Translation App")

uploaded_file = st.file_uploader("Choose an image...", type="jpg")

if uploaded_file is not None:
    # Display the uploaded image
    image = Image.open(uploaded_file)
    st.image(image, caption='Uploaded Image.', use_column_width=True)
    st.write("")

    # Generate caption
    caption = generate_caption(image, trained_model)
    st.write(f"Caption: {caption}")

    # Translate caption
    translation = translate_to_twi(caption, tokenizer, translation_model)
    st.write(f"Translation: {translation}")

    # Convert translation to speech
    if st.button('Play Translation'):
        text_to_speech(translation, lang='tw')
        st.audio("output.mp3", format="audio/mp3")