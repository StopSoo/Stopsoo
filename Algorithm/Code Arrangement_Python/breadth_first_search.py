# BFS : Breadth First Search 너비 우선 탐색
# 시작 노드를 기준으로 가까운 노드를 먼저 방문하면서 탐색
# 기본적으로 BFS는 큐를 이용하여 구현

# 그래프를 표현할 인접 리스트
# Ex>
graph = dict()

graph['A'] = ['B', 'C']
graph['B'] = ['A', 'D']
graph['C'] = ['A', 'G', 'H', 'I']
graph['D'] = ['B', 'E', 'F']
graph['E'] = ['D']
graph['F'] = ['D']
graph['G'] = ['C']
graph['H'] = ['C']
graph['I'] = ['C', 'J']
graph['J'] = ['I']

# BFS 구현 1
from collections import deque

def BFS(graph, start_node):
    # 항상 두 개의 리스트를 별도로 관리하기
    next_visit, visited = deque(), list()
    # 시작 노드를 정하기
    next_visit.append(start_node)

    # 방문할 노드가 남아 있다면 계속 반복
    while next_visit:
        # 노드들 중 첫 번째 데이터를 추출 
        node = next_visit.popleft()
        # 해당 노드가 방문한 노드가 아니라면
        if node not in visited:
            # 방문 목록에 추가
            visited.append(node)
            next_visit.extend(graph[node])  # pop한 노드의 인접 리스트 원소들을 스택에 추가
    return visited

# BFS 구현 2 -> search
import sys
input = sys.stdin.readline

n, m , start = map(int, input().split())    # 정점 개수, 간선 개수, 시작 노드 번호
edge = [[] for _ in range(n + 1)]

def bfs():
    queue = deque([start])
    b_check = [False for _ in range(n+1)]
    b_check[start] = True   # 시작 노드의 방문 여부를 True로 체크
    while queue:
        v = queue.popleft() # 첫 번째 원소 pop
        print(v, end = ' ')
        for i in edge[v]:
            if not b_check[i]:
                b_check[i] = True
                queue.append(i)
