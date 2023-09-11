class MyQueue:
    def __init__(self):
        self.input = []
        self.output = []

    def push(self, x: int) -> None:
        self.input.append(x)
    
    def pop(self) -> int:
        self.peek() # peek 함수를 통해 output 배열에 큐에 맞게 정렬
        return self.output.pop()
    
    def peek(self) -> int:
        # output이 없으면 모두 재입력
        if not self.output:
            while self.input:
                self.output.append(self.input.pop())
        return self.output[-1]
    
    def empty(self) -> bool:
        return self.input == [] and self.output == []