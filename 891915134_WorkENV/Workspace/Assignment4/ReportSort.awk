BEGIN{
	
	count = 0
	
}


{
	if(NF == 5 && $1 ~ /^[a-zA-Z]+$/ && $4 ~ /^[0-9]+$/ && $5 ~ /^[0-9]+$/){
		brand[count] = $1
		model[count] = $2
		year[count] = $3
		mileage[count] = $4
		price[count] = $5
		brandCounter[$1]++
		count++
	}	

}

END{
	print "\n"	
	
	for(i = 0; i<count; i++){
		for(j = i+1; j < count; j++){
			if(price[j] < price[i]){
				temp = price[i]
				price[i] = price[j]
				price[j] = temp
			}
		}		
	}


	for(i1 = 0; i1<count; i1++){
		for(j1 = i1+1; j1 < count; j1++){
			if(mileage[j1]<mileage[i1]){
				temp1 = mileage[i1]
				mileage[i1] = mileage[j1]
				mileage[j1] = temp1
				
			}
		}
	}

	for(i2 = 0; i2<count; i2++){
		for(j2 = i2+1; j2 < count; j2++){
			if(year[j2]<year[i2]){
				temp2 = year[i2]
				year[i2] = year[j2]
				year[j2] = temp2
			}
			
		}
	}	


	for(x = 0; x < count; x++){
		printf("%-10s %-15s %-10s %-10s %-10s\n",brand[x], model[x], year[x], mileage[x], price[x])
	}
}
