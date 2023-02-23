List myAverage := method(sum / size)
arr := list(1,2,3,4,5,6,7)
arr myAverage println

List myAverage := method(
    if(size == 0, nil, sum / size)
    )
arr := list()
arr myAverage println

List myAverage := method(
    sum := 0
    self foreach(val,
        if(val isKindOf(Number), 
            sum = sum + val, 
            Exception raise("Invalid type - must be a Number type")
        )
    )
    return sum / size
)
arr := list(1,2,"five", 5)
arr myAverage println