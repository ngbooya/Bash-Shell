BEGIN{
	max = 0
	maxIndex = 0
	min = 0
	minIndex = 0
	
}

{

	if(NF == 5 && $1 ~ /^[a-zA-Z]+$/ && $3 ~ /^[0-9][0-9][0-9][0-9]$/ && $4 ~ /^[0-9]+$/ && $5 ~ /^[0-9]+$/){
		brand[i] = $1
		model[i] = $2
		year[i] = $3
		mileage[i] = $4
		price[i] = $5
		i++
		brandCounter[$1]++
	}
#	totalBrandCounter[$1]++
}

END{
	
	#Print total entries of each brandi
	for(r in totalBrandCounter){
		print r, " has ", totalBrandCounter[r], " entries."
	}
	print "\n"
	for(t in brandCounter){
        	print t, " has ", brandCounter[t], " valid  entries."
	}
          print "\n"


	# Sort price, then mileage, then year per brand

	for(a in brandCounter){
		for(x in brand){
			if(a == brand[x]){
				
				printf( "%-10s %-15s %-10s %-10s %-10s\n", brand[x], model[x], year[x], mileage[x], price[x]) > (a "-SomeStaticText")
			}
		}
	}
	#Price tiers
	
	print "Cars under $15,000"
	
	printf("\n%-10s %-15s %-10s %-10s %-10s\n\n", "BRAND", "MODEL", "YEAR", "MILEAGE", "PRICE")
	for(x in price){
                  if(price[x]<15000){
  
                          printf("%-10s %-15s %-10s %-10s %-10s\n", brand[x], model[x], year[x], mileage[x], price[x]    )
                  }
          }
 	 
          print "\nCars between $20,000 and $65,000"
	
	printf("\n%-10s %-15s %-10s %-10s %-10s\n\n", "BRAND", "MODEL", "YEAR", "MILEAGE", "PRICE")
          for(y in price){
                  if(20000<=price[y] && price[y]<=65000 ){
  
                          printf("%-10s %-15s %-10s %-10s %-10s\n", brand[y], model[y], year[y], mileage[y], price[y]    )
                  }
          }
  
          print "\n\nCars over $100,000"
	
	printf("\n%-10s %-15s %-10s %-10s %-10s\n\n", "BRAND", "MODEL", "YEAR", "MILEAGE", "PRICE")
          for(z in price){
                  if(100000<price[z]){
  
                          printf("%-10s %-15s %-10s %-10s %-10s\n", brand[z], model[z], year[z], mileage[z], price[z]    )
                  }
          }

	#Find the most expensive car
	
	for(q in price){
                  if(max <= price[q]){
                          max = price[q]
                          maxIndex = q
                  }
  
         }
  
         print "\nMost expensive car:"
  
	printf("\n%-10s %-15s %-10s %-10s %-10s\n\n", "BRAND", "MODEL", "YEAR", "MILEAGE", "PRICE")
         printf("%-10s %-15s %-10s %-10s %-10s\n", brand[maxIndex], model[maxIndex], year[maxIndex], mileage[maxIndex], price[maxIndex])
	#Find the least expensive car
	min = price[1]
	for(p in price){
		if(price[p] < min){
			min = price[p]
			minIndex = p
		}
	}
	print "\nLeast expensive car: "
	
	printf("\n%-10s %-15s %-10s %-10s %-10s\n\n", "BRAND", "MODEL", "YEAR", "MILEAGE", "PRICE")

         printf("%-10s %-15s %-10s %-10s %-10s\n", brand[minIndex], model[minIndex], year[minIndex], mileage[minIndex], price[minIndex])
	print "\nCars sort by price and mileage and year:"
	printf("\n%-10s %-15s %-10s %-10s %-10s\n\n", "BRAND", "MODEL", "YEAR", "MILEAGE", "PRICE")
}


