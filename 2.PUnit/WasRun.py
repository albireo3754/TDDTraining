from TestCase import TestCase

class WasRun(TestCase):
    def __init__(self, name):
        self.wasRun = None
        TestCase.__init__(self, name)        

    def setUp(self):
        self.wasRun = None
        self.wasSetUp = 1

    def run(self):
        self.wasRun = 1
        self.wasSetUp = None