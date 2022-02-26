from unittest import registerResult


class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self):
        result = TestResult()
        result.testStarted()
        self.setUp()
        try:
            method = getattr(self, self.name)
            method()
        except:
            result.testFailed()
        self.tearDown()
        return result

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testBrokenMethod(self):
        pass

class WasRun(TestCase):
    def __init__(self, name):
        self.wasRun = 0
        self.wasSetUp = 0
        TestCase.__init__(self, name)

    def setUp(self):
        self.wasRun = 0
        self.wasSetUp = 1
        self.log = "setUp "
    
    def testMethod(self):
        self.wasRun = 1
        self.log += "testMethod "

    def tearDown(self):
        self.log += "tearDown"

    def testBrokenMethod(self):
        raise Exception

class TestResult:
    def __init__(self):
        self.runCount = 0
        self.failCount = 0
    
    def testStarted(self):
        self.runCount += 1
    
    def testFailed(self):
        self.failCount += 1
        
    def summary(self):
        return str(self.runCount) + " run, " + str(self.failCount) + " failed"

class TestCaseTest(TestCase):
    def testTemplateMethod(self):
        self.test = WasRun("testMethod")
        self.test.run()
        assert(self.test.log == "setUp testMethod tearDown")

    def testResult(self):
        test = WasRun("testMethod")
        result = test.run()
        assert("1 run, 0 failed" == result.summary())
    
    def testFailedResult(self):
        test = WasRun("testBrokenMethod")
        result = test.run()
        assert("1 run, 1 failed" == result.summary())
    
    def testFailedResultFormatting(self):
        result = TestResult()
        result.testStarted()
        result.testFailed()
        assert("1 run, 1 failed" == result.summary())

TestCaseTest("testTemplateMethod").run()
TestCaseTest("testResult").run()
TestCaseTest("testFailedResult").run()
TestCaseTest("testFailedResultFormatting").run()