class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self):
        self.setUp()
        method = getattr(self, self.name)
        method()

    def setUp(self):
        pass

class WasRun(TestCase):
    def __init__(self, name):
        self.wasRun = 0
        self.wasSetUp = 0
        TestCase.__init__(self, name)

    def setUp(self):
        self.wasRun = 0
        self.wasSetUp = 1
    
    def testMethod(self):
        self.wasRun = 1

class TestCaseTest(TestCase):
    def setUp(self):
        self.test = WasRun("testMethod")

    def testSetUp(self):
        self.test.run()
        assert(self.test.wasSetUp)

    def testRunning(self):
        self.test.run()
        assert(self.test.wasRun)

TestCaseTest("testRunning").run()
TestCaseTest("testSetUp").run()
