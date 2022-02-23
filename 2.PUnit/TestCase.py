class TestCase:
    def __init__(self, name):
        self.name = name
    
    def run(self):
        # 파이썬의 장점 클래스 이름이나 메서드 이름을 함수처럼 다룰 수 있다.
        method = getattr(self, self.name)
        method()

    def testMethod(self):
        pass