class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self):
        self.setUp()
        method = getattr(self, self.name)
        method()
        self.tearDown()

    def setUp(self):
        pass

    def tearDown(self):
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

class TestCaseTest(TestCase):
    def testTemplateMethod(self):
        self.test = WasRun("testMethod")
        self.test.run()
        assert(self.test.log == "setUp testMethod tearDown")

TestCaseTest("testTemplateMethod").run()
