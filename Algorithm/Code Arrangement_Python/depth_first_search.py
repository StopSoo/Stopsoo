# DFS : Depth First Search 깊이 우선 탐색
# 필요한 자료 구조 : 그래프를 표현할 인접 리스트, 방문 노드 체크 배열, 스택 구조
# 앞으로 찾아서 가야할 노드와 이미 방문한 노드를 기준으로 탐색한다. 
# 기본적으로 DFS는 스택을 이용하여 구현 but 재귀 함수를 이용하는 것이 편리하다. 

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

# 1. 스택(리스트)을 활용한 DFS 구현
def DFS(graph, start_node):
    # 항상 두 개의 리스트를 별도로 관리하기
    next_visit, visited = list(), list()
    # 시작 노드를 정하기
    next_visit.append(start_node)

    # 방문할 노드가 남아 있다면
    while next_visit:
        # 노드들 중 마지막 데이터를 추출 
        node = next_visit.pop()
        # 해당 노드가 방문한 노드가 아니라면
        if node not in visited:
            # 방문 목록에 추가
            visited.append(node)
            next_visit.extend(graph[node])
    return visited

# 2. 큐를 활용한 DFS 구현
from collections import deque
def DFS2(graph, start_node):
    visited = []
    next_visit = deque()

    # 시작 노드 설정
    next_visit.append(start_node)
    
    # 방문할 노드가 남아 있다면
    while next_visit:
        node = next_visit.pop()
        # 해당 노드가 방문한 노드가 아니라면
        if node not in visited:
            # 방문 목록에 추가
            visited.append(node)
            # 인접 노드들을 방문 예정 리스트에 추가
            next_visit.extend(graph[node])
    return visited

# 3. 재귀함수를 통한 DFS 구현 (!)
# 방문 체크 배열을 매개 변수로 포함시켜서, 재귀 함수를 통해 계속해서 인자들을 담을 수 있게 한다.
# 복습하기
def DFS_recursive(graph, start_node, visited=[]):
    visited.append(start_node)

    for node in graph[start_node]:
        if node not in visited:
            DFS_recursive(graph, node, visited)
    return visited

# 리스트 + 리스트 결합 -> extend