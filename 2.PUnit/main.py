class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self):
        test = TestResult()
        test.testStarted()
        self.setUp()
        method = getattr(self, self.name)
        method()
        self.tearDown()
        return test

    def setUp(self):
        pass

    def tearDown(self):
        pass

class WasRun(TestCase):
    def __init__(self, name):
        self.wasRun = 0
        self.log = ""
        super(WasRun, self).__init__(name)

    def setUp(self):
        self.log = "setUp "

    def testMethod(self):
        self.wasRun = 1
        self.log += "testMethod "

    def testBrokenMethod(self):
        raise Exception

    def tearDown(self):
        self.log += "tearDown "

class TestResult:
    def __init__(self):
        self.runCount = 0

    def testStarted(self):
        self.runCount += 1

    def summary(self):
        return f"{self.runCount} run, 0 failed"

class TestCaseTest(TestCase):
    def setUp(self):
        self.test = WasRun("testMethod")

    def testTemplateMethod(self):
        self.test.run()
        assert("setUp testMethod tearDown " == self.test.log)

    def testResult(self):
        test = WasRun("testMethod")
        result = test.run()
        assert("1 run, 0 failed" == result.summary())

    def testFailedResult(self):
        test = WasRun("testBrokenMethod")
        result = test.run()
        assert("1 run, 1 failed" == result.summary())


TestCaseTest("testTemplateMethod").run()
TestCaseTest("testResult").run()
TestCaseTest("testFailedResult").run()