import random
import unittest
import ConfigParser
import mock
import installStartupUDPClient as installer
from mock import patch, MagicMock, Mock, call
from ludibrio import Dummy

@patch("platform.system", ** { 'return_value' : "Darwin" })
@patch("installStartupUDPClient.copyanything")
@patch("installStartupUDPClient.generateKeyPair")
@patch("installStartupUDPClient.os")
class TestInstallStartupUdpClientDarwin(unittest.TestCase):
    # Mute the bothering output of the scripts
    def setUp(self):
      import sys
      class NullDevice():
            def write(self, s):
                pass
      sys.stdout = NullDevice()

    ### DARWIN
    # It should return directly if there is an installation
    @patch("os.path.exists", ** { 'return_value' : True })
    def test_returns_directly_if_there_is_an_installation(self, *args):
      assert installer.installingStartup() == False

   
    def test_generates_keypair(self,mock_os,keygen,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()
      assert keygen.called

    def test_copies_udp_client_file(self,mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[0] == call("./InstallerFiles/toBeCopied/" + installer.udpClientFile, \
                                     installer.installDirUnixApp + "/" + installer.udpClientFile)

    def test_copies_udp_config_client_file(self, mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[1] == call("./InstallerFiles/toBeCopied/" + installer.udpClientFileCFG, \
                                     installer.installDirUnixApp + "/" + installer.udpClientFileCFG)


    def test_copies_startup_app_caller_file(self, mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[2] == call("./InstallerFiles/toBeCopied/" + installer.startupAppCaller, \
                                     installer.installDirUnixApp + "/" + installer.startupAppCaller)

    def test_copies_startup_app_caller_file_on_install_target(self, mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[3] == call("./InstallerFiles/toBeCopied/com.user.loginscript.plist", \
                                     mock_os.getenv("HOME") + "/Library/LaunchAgents/com.user.loginscript.plist")



@patch("platform.system", ** { 'return_value' : "Linux" })
@patch("installStartupUDPClient.copyanything")
@patch("installStartupUDPClient.generateKeyPair")
@patch("installStartupUDPClient.os")
class TestInstallStartupUdpClientLinux(unittest.TestCase):
    # Mute the bothering output of the scripts
    def setUp(self):
      import sys
      class NullDevice():
            def write(self, s):
                pass
      sys.stdout = NullDevice()

    ### DARWIN
    # It should return directly if there is an installation
    @patch("os.path.exists", ** { 'return_value' : True })
    def test_returns_directly_if_there_is_an_installation(self, *args):
      assert installer.installingStartup() == False

   
    def test_generates_keypair(self,mock_os,keygen,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()
      assert keygen.called

    def test_copies_udp_client_file(self,mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[0] == call("./InstallerFiles/toBeCopied/" + installer.udpClientFile, \
                                     installer.installDirUnixApp + "/" + installer.udpClientFile)

    def test_copies_udp_config_client_file(self, mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[1] == call("./InstallerFiles/toBeCopied/" + installer.udpClientFileCFG, \
                                     installer.installDirUnixApp + "/" + installer.udpClientFileCFG)


    def test_copies_startup_app_caller_file(self, mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      assert copy.mock_calls[2] == call("./InstallerFiles/toBeCopied/" + installer.startupAppCaller, \
                                     installer.installDirUnixApp + "/" + installer.startupAppCaller)

    def test_copies_startup_app_caller_file_on_install_target(self, mock_os,keygen,copy,*args):
      mock_os.path.exists.return_value = False

      installer.installingStartup()

      # assert copy.mock_calls[3] == call("./InstallerFiles/toBeCopied/" + installer.startupAppCaller, \
                                     # "/etc/TIX" + "/" + installer.startupAppCaller)



if __name__ == '__main__':
    unittest.main()

