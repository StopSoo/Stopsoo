# binary search : 이진 탐색
# 인수로 들어오는 배열은 정렬되어 있는 상태이다. 

# 오름차순 정렬 상태
def binary_search(array, target):
    start = 0   # 시작값 인덱스
    end = len(array) - 1    # 끝값 인덱스
    
    while start <= end:
        m = (start + end) // 2  # 중앙값 인덱스
        if array[m] > target:   # 찾는 값보다 중앙값이 더 크다면
            end = m - 1
        elif array[m] < target:   # 찾는 값이 중앙값보다 더 크다면
            start = m + 1
        else:   # 찾는 값을 찾았다면
            print('We find target value :', target, 'for index :', array.index(target))
            break

# Ex>
array = [5, 12, 21, 29, 33, 46, 49, 57, 72, 94, 100]
print(binary_search(array, 33))