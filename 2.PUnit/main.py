class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self, result):
        result.testStarted()
        self.setUp()
        try:
            method = getattr(self, self.name)
            method()
        except:
            result.testFailed()
        self.tearDown()

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testBrokenMethod(self):
        pass

class WasRun(TestCase):
    def __init__(self, name):
        TestCase.__init__(self, name)

    def setUp(self):
        self.log = "setUp "
    
    def testMethod(self):
        self.log += "testMethod "

    def tearDown(self):
        self.log += "tearDown"

    def testBrokenMethod(self):
        self.log += "testBrokenMethod "
        raise Exception

class TestResult(TestCase):
    def __init__(self):
        self.runCount = 0
        self.failCount = 0
    
    def testStarted(self):
        self.runCount += 1
    
    def testFailed(self):
        self.failCount += 1
        
    def summary(self):
        return str(self.runCount) + " run, " + str(self.failCount) + " failed"

class TestSuite(TestCase):
    def __init__(self):
        self.tests = []

    def add(self, test):
        self.tests.append(test)

    def run(self, result):
        for test in self.tests:
            test.run(result)

class TestCaseTest(TestCase):
    def setUp(self):
        self.result = TestResult()

    def testTemplateMethod(self):
        self.test = WasRun("testMethod")
        self.test.run(self.result)
        assert(self.test.log == "setUp testMethod tearDown")

    def testResult(self):
        test = WasRun("testMethod")
        test.run(self.result)
        assert("1 run, 0 failed" == self.result.summary())
    
    def testFailedResult(self):
        test = WasRun("testBrokenMethod")
        test.run(self.result)
        assert("1 run, 1 failed" == self.result.summary())
    
    def testFailedResultFormatting(self):
        self.result.testStarted()
        self.result.testFailed()
        assert("1 run, 1 failed" == self.result.summary())
    
    def testSuite(self):
        suite = TestSuite()
        suite.add(WasRun("testMethod"))
        suite.add(WasRun("testBrokenMethod"))
        suite.run(self.result)
        assert("2 run, 1 failed" == self.result.summary())
    
    def testFailedButTearDownExcute(self):
        self.test = WasRun("testBrokenMethod")
        self.test.run(self.result)
        assert(self.test.log == "setUp testBrokenMethod tearDown")

suite = TestSuite()
suite.add(TestCaseTest("testTemplateMethod"))
suite.add(TestCaseTest("testResult"))
suite.add(TestCaseTest("testFailedResult"))
suite.add(TestCaseTest("testFailedResultFormatting"))
suite.add(TestCaseTest("testSuite"))
suite.add(TestCaseTest("testFailedButTearDownExcute"))
result = TestResult()
suite.run(result)
print(result.summary())