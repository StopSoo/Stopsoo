import sys
input = sys.stdin.readline

n = int(input())    # 배열 원소의 개수
array = list(map(int, input().split()))     # 배열 입력 받음

# swap 함수 정의
def swap(a, b):
    temp = a
    a = b
    b = temp
    return a, b

# selection sort -> O(n^2)
# 오름차순 정렬
for i in range(n):
    # 최솟값 찾기 
    min = array[i]
    for j in range(i+1, n):
        if min > array[j]:
            min = array[j]
            min_idx = j
    # swap
    array[i], array[min_idx] = swap(array[i], array[min_idx])

# print
for i in range(n):
    print(array[i], end=" ")
