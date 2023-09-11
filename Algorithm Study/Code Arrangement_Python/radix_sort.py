# radix sort : 기수 정렬
import collections

# 오름차순 기수 정렬 알고리즘
def radix_sort(array):
    # 각 자릿수를 나타낼 10개의 큐를 가진 배열 만들기
    buckets = [collections.deque() for _ in range(10)]

    max_val = max(array)    # 배열의 최댓값
    Q = collections.deque(array)    # 정렬된 배열 담을 변수
    cur_ten = 1 # 큐에 넣을 자릿수별 값을 나타내는 변수

    while max_val >= cur_ten:   # 자릿수가 최댓값을 넘지 않는 동안 반복
        while Q:
            number = Q.popleft()    # Q에서 pop하는 게 포인트
            buckets[(number // cur_ten) % 10].append(number)
        
        for bucket in buckets:
            while bucket:   # 한 큐가 빌 때까지
                Q.append(bucket.popleft())  # 숫자들을 빼서 큐에 추가
        
        cur_ten *= 10   # 다음 자릿수로 이동 (일 -> 십 -> ..)
    
    return list(Q)

# 장) 비교 연산을 하지 않는다.
#    정렬 속도가 빠르다.
# 단) 공간 복잡도가 높다.