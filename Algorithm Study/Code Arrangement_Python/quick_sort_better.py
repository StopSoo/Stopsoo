# quick_sort()는 크게 sort()와 partition() 2개의 파트로 이루어짐. 
def quick_sort(array, start, end):
    # 원소가 1개인 경우 함수 종료
    if start >= end:
        return
    
    pivot = start     # 첫 번째 원소를 pivot으로 설정
    left = start + 1    # 왼쪽 리스트 시작점 인덱스
    right = end     # 오른쪽 리스트 시작점 인덱스

    while left <= right:
        # 피봇보다 큰 값이 나올 때까지 반복
        while left <= end and array[left] < array[pivot]:
            left += 1
        # 피봇보다 작은 값이 나올 때까지 반복
        while start < right and array[pivot] < array[right]:
            right -= 1  
        # 탐색하는 위치가 엇갈린 경우
        if left > right:
            array[right], array[pivot] = array[pivot], array[right]
        else:
            array[left], array[right] = array[right], array[left]   # swap

    # 분할 이후 왼쪽, 오른쪽 리스트 각각에 대해 퀵 정렬을 수행
    quick_sort(array, 0, right - 1)
    quick_sort(array, right+1, end)


array = [42, 38, 100, 2, 62, 80]
quick_sort(array, 0, len(array)-1)  # 정렬
print(array)    # 출력

# 1. 함수의 파라미터로 넣은 start, end와 리스트 양쪽 끝 시작점인 left, right을 구분
# 2. 탐색하는 위치가 엇갈린 경우 코드에 대한 이해 필요
