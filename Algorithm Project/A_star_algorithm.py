import random

# 부스 체험 시간
timeWeight = [1, 6, 2, 7, 4, 8, 9, 10, 5, 2, 3, 8, 4, 6, 9, 10, 7, 1, 8, 5]

# 부스 간 이동 소요 시간
movingWeightMatrix = [
  [0, 4, 5, 2, 4, 3, 4, 5, 5, 3, 3, 5, 1, 2, 2, 5, 3, 2, 2, 2],
  [4, 0, 3, 4, 3, 3, 4, 4, 5, 2, 1, 1, 5, 5, 5, 2, 2, 2, 1, 4],
  [5, 3, 0, 3, 3, 1, 2, 1, 2, 2, 3, 4, 1, 4, 1, 3, 5, 2, 4, 5],
  [2, 4, 3, 0, 1, 5, 4, 5, 2, 2, 2, 5, 2, 2, 4, 1, 2, 3, 2, 2],
  [4, 3, 3, 1, 0, 2, 1, 4, 3, 4, 3, 1, 3, 3, 5, 2, 3, 3, 2, 3],
  [3, 3, 1, 5, 2, 0, 5, 2, 5, 2, 5, 5, 2, 1, 2, 2, 3, 5, 5, 3],
  [4, 4, 2, 4, 1, 5, 0, 1, 1, 4, 1, 3, 4, 1, 2, 2, 2, 1, 2, 3],
  [5, 4, 1, 5, 4, 2, 1, 0, 3, 2, 2, 5, 1, 1, 5, 4, 4, 2, 3, 1],
  [5, 5, 2, 2, 3, 5, 1, 3, 0, 4, 4, 3, 4, 1, 3, 3, 3, 3, 1, 4],
  [3, 2, 2, 2, 4, 2, 4, 2, 4, 0, 1, 4, 3, 4, 1, 5, 1, 2, 1, 3],
  [3, 1, 3, 2, 3, 5, 1, 2, 4, 1, 0, 3, 3, 1, 1, 3, 4, 3, 1, 5],
  [5, 1, 4, 5, 1, 5, 3, 5, 3, 4, 3, 0, 2, 5, 5, 5, 4, 2, 1, 2],
  [1, 5, 1, 2, 3, 2, 4, 1, 4, 3, 3, 2, 0, 4, 5, 5, 5, 2, 4, 2],
  [2, 5, 4, 2, 3, 1, 1, 1, 1, 4, 1, 5, 4, 0, 1, 3, 1, 3, 5, 5],
  [2, 5, 1, 4, 5, 2, 2, 5, 3, 1, 1, 5, 5, 1, 0, 3, 5, 3, 2, 1],
  [5, 2, 3, 1, 2, 2, 2, 4, 3, 5, 3, 5, 5, 3, 3, 0, 3, 1, 3, 3],
  [3, 2, 5, 2, 3, 3, 2, 4, 3, 1, 4, 4, 5, 1, 5, 3, 0, 3, 1, 4],
  [2, 2, 2, 3, 3, 5, 1, 2, 3, 2, 3, 2, 2, 3, 3, 1, 3, 0, 5, 4],
  [2, 1, 4, 2, 2, 5, 2, 3, 1, 1, 1, 1, 4, 5, 2, 3, 4, 4, 0, 2],
  [2, 4, 5, 2, 3, 3, 3, 1, 4, 3, 5, 2, 2, 5, 1, 3, 4, 4, 2, 0]
]
movingWeightMatrix_len = len(movingWeightMatrix)  

# 부스 간 이동 소요 시간 행렬을 기반으로 인접 리스트를 생성하여 반환
def adjlist(matrix):
  graph = {}
  for i in range(len(matrix)):
      # 노드 이름을 1, 2, 3, ...으로 부여
      node = i + 1
      neighbors = {}
      for j in range(len(matrix[i])):
        if matrix[i][j] != 0:
          # 인접한 노드도 숫자로 부여
          neighbor = j + 1
          weight = matrix[i][j]
          neighbors[neighbor] = weight
      graph[node] = neighbors
  return graph

resultAdjList = adjlist(movingWeightMatrix)
# print(resultAdjList)

# 휴리스틱 함수 - 시간 내에 최대 개수의 부스 돌기
def heuristic(adjList, givenTime):
  route = []  # 최종 경로
  open = []
  totalWeight = 0 # g(n)
  expectedWeights = []  # h(n)
  # 1 ~ 사용자가 입력한 시간의 절반 중 랜덤으로 h(n) 값 설정
  for i in range(20): 
    expectedWeights.append(random.randrange(1, givenTime/2))

  while (totalWeight <= givenTime):
    totalWeight += min(timeWeight)  # 이용 시간이 최소인 부스의 이용 시간 더하기
    route.append(timeWeight.index(min(timeWeight)) + 1) # 탐색한 부스의 인덱스를 경로 리스트에 추가
    timeWeight.pop(min(timeWeight)) # 이용 시간 리스트에서 제거
    

heuristic(resultAdjList, 30)