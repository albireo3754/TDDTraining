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
        self.log = ""
        super(WasRun, self).__init__(name)

    def setUp(self):
        self.log = "setUp "

    def testMethod(self):
        self.wasRun = 1
        self.log += "testMethod "

    def tearDown(self):
        self.log += "tearDown "

class TestCaseTest(TestCase):
    def setUp(self):
        self.test = WasRun("testMethod")

    def testTemplateMethod(self):
        self.test.run()
        assert("setUp testMethod tearDown " == self.test.log)

TestCaseTest("testTemplateMethod").run()