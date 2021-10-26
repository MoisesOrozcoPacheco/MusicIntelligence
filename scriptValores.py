from __future__ import print_function
import librosa
import librosa.display 
import numpy, scipy, matplotlib.pyplot as plt, IPython.display as ipd, sklearn
import matplotlib.pyplot as plt 
import pandas as pd
import numpy as np

def Spectral_Centroid(files):
	recordS_C = pd.DataFrame()
	data = []
	for x in files:
		print(x)
		y,sr = librosa.load(x,duration =60)
		S_C = librosa.feature.spectral_centroid(y, sr = sr)[0]
		for j in range(len(S_C)):              
			data.append(S_C[j])
		print("data:",len(data))
		recordS_C[x] = data
		data = []
	#print ("S_C:",recordS_C)	
	recordS_C.to_csv('S_C_IA.csv')

def Spectral_Rolloff(files):
	recordS_F = pd.DataFrame()
	data = []
	for x in files:
		y,sr = librosa.load(x,duration =60)
		S_F = librosa.feature.spectral_rolloff(y+0.01, sr=sr)[0]
		for j in range(len(S_F)):              
			data.append(S_F[j])
		recordS_F[x] = data
		data = []
	#print ("S_F:",recordS_F)	
	recordS_F.to_csv('S_F.csv')

def Zero_Crossing_Rate(files):
	recordZ_C_R = pd.DataFrame()
	data = []
	for x in files:
		y,sr = librosa.load(x,duration =60)
		Z_C_R = librosa.feature.spectral_rolloff(y+0.01, sr=sr)[0]
		for j in range(len(Z_C_R)):              
			data.append(Z_C_R[j])
		recordZ_C_R[x] = data
		data = []
	#print ("Z_C_R:",recordZ_C_R)	
	recordZ_C_R.to_csv('Z_C_R.csv')

def Mel_Frequency_Cepstral_Coefficient(files):
	recordMFCC = pd.DataFrame()
	data = []
	for x in files:
		y,sr = librosa.load(x,duration =60)
		MFCC = librosa.feature.mfcc(y,sr)[0] 		
		for j in range(len(MFCC)):              
			data.append(MFCC[j])
		recordMFCC[x] = data
		data = []
	#print ("MFCC:",recordMFCC)	
	recordMFCC.to_csv('MFCC.csv')

def main():
	pathAudio = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\librosasongs"
	files  = librosa.util.find_files(pathAudio, ext =['wav'])
	files = np.asarray(files)
	Spectral_Centroid(files)
	Spectral_Rolloff(files)
	Zero_Crossing_Rate(files)
	Mel_Frequency_Cepstral_Coefficient(files)

main()