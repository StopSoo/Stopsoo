# merge sort 
# two pointer concept

# 내가 작성한 코드
# 문제점 1) 분할은 없고, 병합만 있음
# 문제점 2) 케이스를 너무 복잡하게 나눔
# 문제점 3) 나머지 원소들을 추가할 때 원소를 하나씩 추가해서 불필요하게 반복문을 사용 -> 시간 낭비, 메모리 낭비
def merge_sort(array1, array2):
    index1 = index2 = 0  # array1, array2 index
    result = []

    for i in range(len(array1) + len(array2)):
        if array1[index1] <= array2[index2]:    # 좌측 리스트의 원소가 더 작을 경우
            result.append(array1[index1])
            if index1 + 1 == len(array1):    # array1 모든 원소 추가 완료라면
                while index2 < len(array2): # array2 나머지 원소들 추가
                    result.append(array2[index2])
                    index2 += 1
                break
            else:
                index1 += 1
        elif array1[index1] > array2[index2]:   # 우측 리스트의 원소가 더 작을 경우
            result.append(array2[index2])
            if index2 + 1 == len(array2):    # array2 모든 원소 추가 완료라면
                while index1 < len(array1): # array1 나머지 원소들 추가
                    result.append(array1[index1])
                    index1 += 1
                break
            else:
                index2 += 1
    return result

array_1 = [24, 32, 42, 60]
array_2 = [5, 15, 45, 90]

array = merge_sort(array_1, array_2)
print(array)


# commentary를 참고해서 다시 작성한 코드
# 가물가물했기 때문에 확실하게 짚고 넘어갈 부분 : 분할은 중앙 값을 이용하며, 재귀 함수를 사용한다.
# 배울 부분 : 굳이 반복문을 사용하지 않고 슬라이싱과 리스트 연산을 이용해서 나머지 원소들을 리스트에 추가한다. (line 61, 62)
#           but, 리스트 slicing 시 배열의 복제가 일어나기 때문에 메모리 상의 효율은 좋지 않다. 하지만 간단하게 작성 가능 !
def merge_sort2(array):
    if len(array) < 2:  # 원소 개수가 2보다 작을 경우 배열을 그대로 반환
        return array
    
    mid = len(array) // 2   # 배열의 중앙값 인덱스
    low_array = merge_sort2(array[:mid])     # 좌측 배열 
    high_array = merge_sort2(array[mid:])    # 우측 배열

    index1 = index2 = 0  # array1, array2 index
    result = [] # 결과 배열
    # 최소한 한 쪽 리스트의 정렬이 끝날 때까지 반복
    while index1 < len(low_array) and index2 < len(high_array):
        if low_array[index1] < high_array[index2]:  # 왼쪽 리스트의 값이 더 작을 경우
            result.append(low_array[index1])
            index1 += 1
        else:   # 오른쪽 리스트의 값이 더 작을 경우
            result.append(high_array[index2])
            index2 += 1
    # 최소한 한 쪽 리스트의 정렬이 끝났을 것
    result += low_array[index1:]
    result += high_array[index2:]
    return result

array2 = [24, 32, 42, 60, 5, 15, 45, 90]
array2 = merge_sort2(array2)
print(array2)