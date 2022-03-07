class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self, result):
        result.testStarted()
        self.setUp()
        try:
            method = getattr(self, self.name)
            method()
        except Exception as e:
            result.testFailed(self.name, str(e))
        self.tearDown()
        return result

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
        self.log += "testBrokenMethod "
        raise Exception("fail")

    def tearDown(self):
        self.log += "tearDown "

class TestResult:
    def __init__(self):
        self.runCount = 0
        self.failCount = 0
        self.failMessages = []

    def testStarted(self):
        self.runCount += 1

    def testFailed(self, name, message):
        self.failCount += 1
        self.failMessages.append(f"def {name} fail")

    def summary(self):
        resultMessage = f"{self.runCount} run, {self.failCount} failed"
        for failMessage in self.failMessages:
            resultMessage += f"\n{failMessage}"
        return resultMessage

class TestSuite:
    def __init__(self):
        self.tests = []

    def add(self, test):
        self.tests.append(test)

    def run(self):
        result = TestResult()
        for test in self.tests:
            test.run(result)
        return result

class TestCaseTest(TestCase):
    def setUp(self):
        self.result = TestResult()
        self.test = WasRun("testMethod")

    def testTemplateMethod(self):
        self.test.run(self.result)
        assert("setUp testMethod tearDown " == self.test.log)

    def testResult(self):
        test = WasRun("testMethod")
        self.result = test.run(self.result)
        assert("1 run, 0 failed" == self.result.summary())

    def testFailedResult(self):
        test = WasRun("testBrokenMethod")
        result = test.run(self.result)
        assert("1 run, 1 failed\ndef testBrokenMethod fail" == result.summary())

    def testFailedResultFormatting(self):
        result = TestResult()
        result.testStarted()
        result.testFailed("testFailed", "")
        assert("1 run, 1 failed\ndef testFailed fail" == result.summary())

    def testSuite(self):
        suite = TestSuite()
        suite.add(WasRun("testMethod"))
        suite.add(WasRun("testBrokenMethod"))
        result = suite.run()
        assert("2 run, 1 failed\ndef testBrokenMethod fail" == result.summary())

    def testTearDownExcuteIfTestFailed(self):
        test = WasRun("testBrokenMethod")
        test.run(self.result)
        assert(test.log == "setUp testBrokenMethod tearDown ")

    def testFailMessage(self):
        test = WasRun("testBrokenMethod")
        test.run(self.result)
        assert("1 run, 1 failed\ndef testBrokenMethod fail" == self.result.summary()), "testFailMessage"

suite = TestSuite()
suite.add(TestCaseTest("testTemplateMethod"))
suite.add(TestCaseTest("testResult"))
suite.add(TestCaseTest("testFailedResult"))
suite.add(TestCaseTest("testFailedResultFormatting"))
suite.add(TestCaseTest("testSuite"))
suite.add(TestCaseTest("testTearDownExcuteIfTestFailed"))
suite.add(TestCaseTest("testFailMessage"))
print(suite.run().summary())
