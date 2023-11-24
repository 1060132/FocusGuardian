import keras

from keras.preprocessing.image import ImageDataGenerator
from keras.models import Sequential
from keras.layers import Dense,Dropout, Activation,Flatten, BatchNormalization
from keras.layers import Conv2D,MaxPooling2D
import os

num_classes = 5
img_rows, img_cols = 48,48
batch_size = 32

train_data_dir = "fer2013/train"
validation_data_dir = "fer2013/validation"

train_datagen = ImageDataGenerator(
    train_data_dir,
    rescale=1./255,
    rotation_range=30,
    shear_range=0.3,
    zoom_range=0.3,
    width_shift_range=0.4,
    height_shift_range=0.4,
    horizontal_flip=True,
    fill_mode="nearest")
validation_datagen = ImageDataGenerator(rescale=1./255)

train_generator = train_datagen.flow_from_directory(
    train_data_dir,
    color_mode="grayscale",
    target_size=(img_rows, img_cols),
    batch_size=batch_size,
    shuffle=True)

validation_data = validation_datagen.flow_from_directory(
    validation_data_dir,
    color_mode="grayscale",
    target_size=(img_rows, img_cols),
    batch_size=batch_size,
    shuffle=True
)

model = Sequential()

#1.Block

model.add(Conv2D(32,(3,3), padding="same", kernel_initializer="he_normal", input_shape = (img_rows,img_cols,1)))

model.add(Activation())