from odbAccess import *
import os


def inpExecut():
    
    jobName='abq6141 job='
    jobNum='pot_SIM_blowMould44'+'.inp'
    jobParams=' int double=both ask_delete=OFF user=VUMAT_S4R_v2_6_6PLLA.for'
#    jobParams=' int double=both ask_delete=OFF'    
    myReturn=0
    # try:    
        # f = open("pot_SIM_blowMould33.lck", "w")
        # f.close()   
        # os.remove('pot_SIM_blowMould33.lck')
    os.system(jobName+jobNum+jobParams)
    return 0
######WAY-1##############	
#(1)creat odb object:odb=openOdb(path=odbName+'.odb')	
#(2)create the fieldOutput object:fieldObj=odb.steps['Step-1'].frames[-1].fieldOutputs['STH']
#(3)create odbSet object in assembly:odbInst=odb.rootAssembly.elementSets['RECORD']
#note: if want to create odbSet in the parts:odbInst=odb.rootAssembly.instances['TUBE-1'].elementSets['STRAIGHT']
#(4)create fieldValue object:fldValue=fieldObj.getSubset(region=odbInst)
#(5)read the values output:result=fldValue.values[0].data
######WAY-2##############	
#(1)creat odb object:odb=openOdb(path=odbName+'.odb')	
#(2)create the fieldOutput repository object:fieldObj=odb.steps['Step-1'].frames[-1].fieldOutputs
#(3)create odbSet object in assembly:odbInst=odb.rootAssembly.elementSets['RECORD']
#note: if want to create odbSet in the parts:odbInst=odb.rootAssembly.instances['TUBE-1'].elementSets['STRAIGHT']
#(4)create fieldOutput object for each variable by the repository object:
#fieldObj1=fieldObj['STH']//fieldObj2=fieldObj['NE11']//fieldObj3=fieldObj['NE22']//fieldObj4=fieldObj['TEMP']
#(4)create fieldValue object for each variable:
#fldValue1=fieldObj1.getSubset(region=odbInst)//fldValue2=fieldObj2.getSubset(region=odbInst)//fldValue3=fieldObj3.getSubset(region=odbInst)
#//fldValue4=fieldObj4.getSubset(region=odbInst)
#(5)read the values output:
#resSTH=fldValue1.values[0].data//resNE11=fldValue2.values[0].data//resNE22=fldValue3.values[0].data//resTemp=fldValue4.values[0].data	
######CHECKING##############
#odb=session.odbs['pot_SIM_blowMould3.odb']
def odbOperation(odbName):
    odb = openOdb(path=odbName+'.odb')
	#read results from ODB result file
    step1 = odb.steps['Step-1']
	
	###########################################
	#CREEATE ODB SETS FOR EACH ZONE
    odbInst1=odb.rootAssembly.elementSets['ZONE-1']
    odbInst2=odb.rootAssembly.elementSets['ZONE-2']
    odbInst3=odb.rootAssembly.elementSets['ZONE-3']
    odbInst4=odb.rootAssembly.elementSets['ZONE-4']
    odbInst5=odb.rootAssembly.elementSets['ZONE-5']  
    odbInst6=odb.rootAssembly.elementSets['ZONE-6']     
	#CREEATE ODB SETS FOR EACH ZONE
	#result are 'STH','TEMP','NE11','NE22'for four zones
    fieldObj=step1.frames[-1].fieldOutputs
    fieldObj1=fieldObj['STH']
    fieldObj2=fieldObj['TEMP']
    fieldObj3=fieldObj['NE']
    fieldObj4=fieldObj['NE']    
	#CREEATE FIELD VALUES FOR EACH ODB SETS FOR EACH ZONE
    fldValue11=fieldObj1.getSubset(region=odbInst1)
    fldValue12=fieldObj1.getSubset(region=odbInst2)
    fldValue13=fieldObj1.getSubset(region=odbInst3)
    fldValue14=fieldObj1.getSubset(region=odbInst4)
    fldValue15=fieldObj1.getSubset(region=odbInst5)
    fldValue16=fieldObj1.getSubset(region=odbInst6)
	
    fldValue21=fieldObj2.getSubset(region=odbInst1)
    fldValue22=fieldObj2.getSubset(region=odbInst2)
    fldValue23=fieldObj2.getSubset(region=odbInst3)
    fldValue24=fieldObj2.getSubset(region=odbInst4)
    fldValue25=fieldObj2.getSubset(region=odbInst5)
    fldValue26=fieldObj2.getSubset(region=odbInst6)
	
    fldValue31=fieldObj3.getSubset(region=odbInst1)
    fldValue32=fieldObj3.getSubset(region=odbInst2)
    fldValue33=fieldObj3.getSubset(region=odbInst3)
    fldValue34=fieldObj3.getSubset(region=odbInst4)
    fldValue35=fieldObj3.getSubset(region=odbInst5)
    fldValue36=fieldObj3.getSubset(region=odbInst6)
    
    fldValue41=fieldObj4.getSubset(region=odbInst1)
    fldValue42=fieldObj4.getSubset(region=odbInst2)
    fldValue43=fieldObj4.getSubset(region=odbInst3)
    fldValue44=fieldObj4.getSubset(region=odbInst4)	
    fldValue45=fieldObj4.getSubset(region=odbInst5)	
    fldValue46=fieldObj4.getSubset(region=odbInst6)		
	###ADD VALUES TO ARRAYS OF EACH ZONE
    res1=fldValue11.values[0].data
    res2=fldValue21.values[0].data
    res3=fldValue31.values[0].data[0]
    res4=fldValue41.values[0].data[1]
    zone1=[res1,res2,res3,res4]
    zone2=[fldValue12.values[0].data,fldValue22.values[0].data,fldValue32.values[0].data[0],fldValue42.values[0].data[1]]
    zone3=[fldValue13.values[0].data,fldValue23.values[0].data,fldValue33.values[0].data[0],fldValue43.values[0].data[1]]
    zone4=[fldValue14.values[0].data,fldValue24.values[0].data,fldValue34.values[0].data[0],fldValue44.values[0].data[1]]
    zone5=[fldValue15.values[0].data,fldValue25.values[0].data,fldValue35.values[0].data[0],fldValue45.values[0].data[1]]
    zone6=[fldValue16.values[0].data,fldValue26.values[0].data,fldValue36.values[0].data[0],fldValue46.values[0].data[1]]
	
    outputfile=open('ResZone1.dat','w')
    outputfile.write('STH'+','+'Temp'+','+'NE11'+','+'NE22'+'\n')
    outputfile.write(str(zone1[0])+','+str(zone1[1])+','+str(zone1[2])+','+str(zone1[3])+'\n')
    outputfile.write(str(zone2[0])+','+str(zone2[1])+','+str(zone2[2])+','+str(zone2[3])+'\n')
    outputfile.write(str(zone3[0])+','+str(zone3[1])+','+str(zone3[2])+','+str(zone3[3])+'\n')
    outputfile.write(str(zone4[0])+','+str(zone4[1])+','+str(zone4[2])+','+str(zone4[3])+'\n')
    outputfile.write(str(zone5[0])+','+str(zone5[1])+','+str(zone5[2])+','+str(zone5[3])+'\n')
    outputfile.write(str(zone6[0])+','+str(zone6[1])+','+str(zone6[2])+','+str(zone6[3])+'\n')    
    outputfile.close()
    odb.close()
	
	# myRegion=step1.historyRegions['Element PART-1-1.86 Int Point 1 Section Point 1']
	
	# NE11data= myRegion.historyOutputs['NE11'].data
	# NE22data= myRegion.historyOutputs['NE22'].data
	# S11data= myRegion.historyOutputs['S11'].data
	# S22data= myRegion.historyOutputs['S22'].data
	
	# Store the time and strain, stress data
	# resTime=[]
	

	# for i in range(len(NE11data)):
		
		# resTime.append(NE11data[i][0])
		# resNE11.append(NE11data[i][1])
		# resNE22.append(NE22data[i][1])
		# resS11.append(S11data[i][1])
		# resS22.append(S22data[i][1])
        	
	
	#write result file to 'ResZone.dat' and 'ResForm.dat'
	
    return 0	
	
res=inpExecut()
odbName='pot_SIM_blowMould44'
res1=odbOperation(odbName)
