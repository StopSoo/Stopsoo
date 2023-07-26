import sys
input = sys.stdin.readline

n = int(input())    # 배열 원소의 개수
array = list(map(int, input().split()))     # 배열 입력 받기 

def insertion_sort(array):
    for end in range(1, n):
        i = end     # 삽입할 값의 인덱스
        while i > 0 and array[i-1] > array[i]:  # 정렬 안 된 부분만 할 수 있게 !
            array[i-1], array[i] = array[i], array[i-1] # swap
            i -= 1
    return array

print(*insertion_sort(array))