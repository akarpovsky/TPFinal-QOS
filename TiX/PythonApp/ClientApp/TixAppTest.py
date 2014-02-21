import random
import unittest
import ConfigParser
import mock
from mock import patch, MagicMock
from ludibrio import Dummy

class TestSequenceFunctions(unittest.TestCase):
    def setUp(self):
        self.kivy = MagicMock()

        class Fake(object):
          def __init__(self, **kwargs):
            return
          def add_widget(self, *args, **kwargs):
            return
          def open(self):
            return

        self.kivy.BoxLayout = Fake
        self.kivy.Popup = Fake
        self.kivy.TextInput = mock.Mock()

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
            "kivy.uix.image" : self.kivy,
            "webbrowser" : self.kivy,
            "ConfigParser" : self.kivy
        }

        self.module_patcher = patch.dict("sys.modules", kivyDict)
        self.module_patcher.start()

    @patch("os.path.exists", ** { 'return_value' : True })
    def test_shows_splash_when_installation_exists(self, path):
        import TixApp
        with patch.object(TixApp.LoginScreen, 'show_already_installed_popup') as fn:
          screen = TixApp.LoginScreen()
          fn.assert_called_with()

    @patch("os.path.exists", ** { 'return_value' : False })
    def test_shows_splash_when_installation_not_exists(self, path):
        import TixApp
        with patch.object(TixApp.LoginScreen, 'show_install_form') as fn:
          screen = TixApp.LoginScreen()
          fn.assert_called_with()

if __name__ == '__main__':
    unittest.main()

