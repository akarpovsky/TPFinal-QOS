import wx
import wx.lib.sized_controls as sc

class FormDialog(sc.SizedDialog):
    def __init__(self, parent, id):
        sc.SizedDialog.__init__(self, None, -1, "Proyecto TiX", 
                        style=wx.DEFAULT_DIALOG_STYLE | wx.RESIZE_BORDER)
        

        pane = self.GetContentsPane()
        pane.SetSizerType("form")
        
        # row 1
        wx.StaticText(pane, -1, "Usuario")
        self.userInput = wx.TextCtrl(pane, -1, "Su email aqui")
        self.userInput.SetSizerProps(expand=True)
        
        # row 2
        wx.StaticText(pane, -1, "Password")
        self.passwordInput = wx.TextCtrl(pane, -1, "")
        self.passwordInput.SetSizerProps(expand=True)
        
        # row 3
        wx.StaticText(pane, -1, "Instalacion")
        wx.Choice(pane, -1, choices=["Casa", "Trabajo"])
        
        # end row 5
        
        # add dialog buttons
        self.SetButtonSizer(self.CreateStdDialogButtonSizer(wx.OK | wx.CANCEL))
        
		# Set events

        # a little trick to make sure that you can't resize the dialog to
        # less screen space than the controls need
        self.Fit()
        self.SetMinSize(self.GetSize())


#---------------------------------------------------------------------------


if __name__ == '__main__':
	app = wx.App(False)  # Create a new app

	while True:
		dlg =  FormDialog(None, -1)
		val = dlg.ShowModal()
		if val == wx.ID_OK:
			userInput = dlg.userInput.GetValue()
			passwordInput = dlg.passwordInput.GetValue()
			dlg.Destroy()

			if userInput ==  'normal@normal.com' and passwordInput == 'a': # Here we validate the TiX user and password
				break
			else:
				error = wx.MessageDialog(None, 'Las credenciales ingresadas son incorrectas. Prueba usando normal@normal.com con password a', 'Error', wx.OK | wx.ICON_ERROR)
    			error.ShowModal()
    			error.Destroy()
		else:
			dlg.Destroy()
			break # Exit because of cancel button was pressed

	app.MainLoop()
