### 조합 핵심이론

- $nCr = n!/(n-r)!r!$ ➡️ n개의 숫자에서 r개를 뽑는 경우의 수
- $nPr = n!/(n-r)!$   ➡️ n개의 숫자 중 r개를 뽑는 순서를 고려해 나열할 경우의 수

➡️ 순열과 조합의 차이는 순서의 고려 유무

> **알고리즘을 위한 핵심사항**
> 

<img width="740" alt="Screenshot 2023-10-23 at 10 59 44" src="https://github.com/StopSoo/Stopsoo/assets/114139700/219a9154-0e98-456a-aae2-3ab4d4a42185">

<img width="914" alt="Screenshot 2023-10-23 at 11 01 52" src="https://github.com/StopSoo/Stopsoo/assets/114139700/0f0be540-6be6-48ee-8d3b-0c52547ce8f7">

➡️ { 5가 선택되었을 때 : $4C2$ } + { 5가 선택되지 않았을 때 : $4C3$ }

➡️ 100%를 커버하기 때문에 이와 같이 풀 것 !

➡️  $5C3 = 4C2 + 4C3$

<img width="920" alt="Screenshot 2023-10-23 at 11 04 32" src="https://github.com/StopSoo/Stopsoo/assets/114139700/83057326-281e-4e8e-a585-12062b7afcf3">

➡️ 이를 일반화하면 $D[i][j] = D[i-1][j-1] + D[i-1][j]$

<img width="946" alt="Screenshot 2023-10-23 at 11 05 55" src="https://github.com/StopSoo/Stopsoo/assets/114139700/7c81d623-d53b-4234-ae1e-8498b014f787">
