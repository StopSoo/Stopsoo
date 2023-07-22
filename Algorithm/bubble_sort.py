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

# bubble sort -> O(n^2)
for i in range(n):
    for j in range(n-i-1):
        if array[j] > array[j+1]:
            array[j], array[j+1] = swap(array[j], array[j+1])

# print
for i in range(n):
    print(array[i], end=" ")