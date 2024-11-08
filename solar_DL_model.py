import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import SGD
from keras.optimizers import Adam

# Optional: Plot the training history
import matplotlib.pyplot as plt
%matplotlib inline


# Load the dataset
data_file_path = 'combined_solar_irradiance_data_1.csv'
data = pd.read_csv(data_file_path)
# print(data.columns)

# Delete the 3rd column (index 2)
data.drop(data.columns[2], axis=1, inplace=True)

# Check for NaN or Inf values
#print(data.isna().sum())
#print(np.isinf(data).sum())


# Separate features (inputs) and target (output)
X = data[['latitude', 'longitude','month', 'day', 'hour']]
y = data['solar_irradiance']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Normalize the input features
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Define the model
model = Sequential()
model.add(Dense(64, input_shape=(X_train.shape[1],), activation='relu'))
model.add(Dense(32, activation='relu'))
model.add(Dense(16, activation='relu'))
model.add(Dense(1))

# Compile the modelmodel.compile(optimizer=Adam(learning_rate=0.001), loss='mse', metrics=['mae'])
#optimizer = SGD(learning_rate=0.08, momentum=0.7)
#model.compile(optimizer=optimizer, loss='mean_squared_error', metrics=['mae'])
model.compile(optimizer=Adam(learning_rate=0.002), loss='mse', metrics=['mae'])
# Train the model
history = model.fit(X_train, y_train, epochs=100, batch_size=32, validation_split=0.2, verbose=1)


# Save the model in SavedModel format
#model.save('saved_model')

# Evaluate the model
#test_loss, test_mae = model.evaluate(X_test, y_test, verbose=1)
#print(f'Test MAE: {test_mae}')

# Make predictions
#y_pred = model.predict(X_test)


#plt.figure(figsize=(12, 4))
#plt.subplot(1, 2, 1)
#plt.plot(history.history['loss'], label='Training Loss')
#plt.plot(history.history['val_loss'], label='Validation Loss')
#plt.xlabel('Epochs')
#plt.ylabel('Loss')
#plt.legend()

#plt.subplot(1, 2, 2)
#plt.plot(history.history['mae'], label='Training MAE')
#plt.plot(history.history['val_mae'], label='Validation MAE')
#plt.xlabel('Epochs')
#plt.ylabel('MAE')
#plt.legend()

#plt.show()
