def xo(input: int):
    for x in range(input):
        for y in range(input):
            if (x==y or y==0 or y == input-1): 
                print("X", end ="") 
            else: 
                print("O",end ="")                 
        print()        
xo(7)