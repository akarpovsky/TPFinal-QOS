import random
import unittest
import ludibrio
from mock import patch, MagicMock

class TestSequenceFunctions(unittest.TestCase):
    def setUp(self):
        self.seq = range(10)
        self.kivy = MagicMock()
        
        kivyDict = { 
            "kivy" : self.kivy, 
            "kivy.app" : self.kivy,
            "kivy.uix" : self.kivy,
            "kivy.uix.gridlayout" : self.kivy,
            "kivy.uix.boxlayout" : self.kivy,
            "kivy.uix.label" : self.kivy,
            "kivy.uix.button" : self.kivy,
            "kivy.uix.textinput" : self.kivy,
            "kivy.uix.popup" : self.kivy,
            "kivy.uix.spinner" : self.kivy,
            "kivy.uix.dropdown" : self.kivy,
            "kivy.network" : self.kivy,
            "kivy.network.urlrequest" : self.kivy,
            "kivy.config" : self.kivy,
            "kivy.graphics" : self.kivy,
            "kivy.uix.image" : self.kivy
        }

        self.module_patcher = patch.dict("sys.modules", kivyDict)
        self.module_patcher.start()
        from TixApp import TixApp

    # def test_shows_splash_when_installation_exists(self):
      

    def test_shuffle(self):
        # make sure the shuffled sequence does not lose any elements
        random.shuffle(self.seq)
        self.seq.sort()
        self.assertEqual(self.seq, range(10))

        # should raise an exception for an immutable sequence
        self.assertRaises(TypeError, random.shuffle, (1,2,3))

    def test_choice(self):
        element = random.choice(self.seq)
        self.assertTrue(element in self.seq)

    def test_sample(self):
        with self.assertRaises(ValueError):
            random.sample(self.seq, 20)
        for element in random.sample(self.seq, 5):
            self.assertTrue(element in self.seq)

if __name__ == '__main__':
    unittest.main()

