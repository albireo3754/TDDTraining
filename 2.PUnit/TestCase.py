from TestResult import TestResult


class TestCase:
    def __init__(self, name):
        self.name = name
        self.log = ""
    
    def run(self, result):
        result.testStarted()
        self.setUp()
        print(result)
        print(self)
        try:
            # 파이썬의 장점 클래스 이름이나 메서드 이름을 함수처럼 다룰 수 있다.
            method = getattr(self, self.name)
            method()
        except:
            result.testFailed()
        self.tearDown()

    def testMethod(self):
        pass

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testSuite(self):
        pass