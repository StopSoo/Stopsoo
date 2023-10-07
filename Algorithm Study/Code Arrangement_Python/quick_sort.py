def quick_sort(array):
    if len(array) <= 1:
        return array
    pivot = array[len(array) // 2]
    lesser_array, equal_array, greater_array = [], [], []
    for num in array:
        if num < pivot:
            lesser_array.append(num)
        elif num > pivot:
            greater_array.append(num)
        else:
            equal_array.append(num)
    return quick_sort(lesser_array) + equal_array + quick_sort(greater_array)

# 구현하기는 쉽지만 메모리 측면에서 비효율적임. 