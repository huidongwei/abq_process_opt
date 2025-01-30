import os
from scipy.optimize import *
import numpy as np
import datetime
import re
import time

def mainOp():
    jobName1='abaqus python operation1.py'
    myReturn1=os.system(jobName1)

    return 0
####################################################################	
def inpOperation(inpName,params):
	inputfile = open('pot_SIM_blowMould4.inp','r')
	outputfile=open(inpName,'w')
	for line in inputfile:
		values=line.split(',')
		#print values
		for i in range(len(values)):
			if values[i]=='zone1':
				#line[line.index('     1.15')]=str(params[0])
				#print 'find orientation factor'
				line=line.replace('0.00',str(params[0]))
			if values[i]=='zone2':
				#line[line.index('353.65')]=str(params[1])
				#print 'find temperature'
				#print line[0]
				line=line.replace('0.00',str(params[1]))
			if values[i]=='zone3':
				#line[line.index('353.65')]=str(params[1])
				#print 'find temperature'
				#print line[0]
				line=line.replace('0.00',str(params[2]))
			if values[i]=='zone4':
				#line[line.index('353.65')]=str(params[1])
				#print 'find temperature'
				#print line[0]
				line=line.replace('0.00',str(params[3]))				
			if values[i]=='zone5':
				#line[line.index('353.65')]=str(params[1])
				#print 'find temperature'
				#print line[0]
				line=line.replace('0.00',str(params[4]))	
			if values[i]=='zone6':
				#line[line.index('353.65')]=str(params[1])
				#print 'find temperature'
				#print line[0]
				line=line.replace('0.00',str(params[5]))	                
		outputfile.write(line)
	inputfile.close()
	outputfile.close()
	return 0
####################################################################
def readZoneFile(fileName):
    inputfile = open(fileName,'r')
    outputfile=open('RecordingResult1.dat','a')
    STH=[]
    Temp=[]
    NE11=[]
    NE22=[]
    FormTime=[]
    for line in inputfile:
        outputfile.write(line)
        try:
            values=line.split(',')
            STH.append(float(values[0]))        
            Temp.append(float(values[1]))   
            NE11.append(float(values[2]))
            NE22.append(float(values[3]))
			# FormTime.append(float(values[4]))				
        except ValueError: 
            print('error')
    inputfile.close()
    outputfile.close()
    return STH
####################################################################
def tempOpt(params):

    # params[0]=round(params[0],2)+273.15
    # params[1]=round(params[1],2)+273.15
    # params[2]=round(params[2],2)+273.15
    # params[3]=round(params[3],2)+273.15
	
    res3=inpOperation('pot_SIM_blowMould44.inp',params)
    
    res2=mainOp()
    
    STH=readZoneFile('ResZone1.dat')
    
    maxSTH=max(STH)
    minSTH=min(STH)
    
    return (maxSTH/minSTH)

params=[350.15,350.15,350.15,350.15,350.15,350.15]
myMax=350.15
myMin=345.15
#res=minimize(tempOpt,params,bounds=((72,77),(72,77),\
#                                    (72,77),(72,77)))
res=minimize(tempOpt,params,method='L-BFGS-B',bounds=((myMin,myMax),(myMin,myMax),\
               (myMin,myMax),(myMin,myMax),(myMin,myMax),(myMin,myMax)),options={ 'disp':1,'eps': 1e0, \
                                    'maxiter': 100})