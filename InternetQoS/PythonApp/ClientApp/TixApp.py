from kivy.app import App
from kivy.uix.gridlayout import GridLayout
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.network.urlrequest import UrlRequest
from kivy.uix.popup import Popup
from kivy.uix.spinner import Spinner
from kivy.uix.dropdown import DropDown
from functools import partial
from kivy.config import Config
from kivy.graphics import Color, Rectangle
import webbrowser
import ConfigParser

Config.set('graphics', 'width', '600')
Config.set('graphics', 'height', '350')

# Tomo data del archivo de configuracion
config = ConfigParser.ConfigParser()
config.read('tixapp.cfg')
tixBaseUrl = config.get("TiXClient", "tixBaseUrl")

class LoginScreen(BoxLayout): #BoxLayout para poner arriba el form y abajo el boton de aceptar

 def __init__(self, **kwargs):
    super(LoginScreen, self).__init__(**kwargs)

    # Background color
    # with self.canvas.before:
    # 	Color(rgba=(.5, .5, .5))
    # 	self.rect = Rectangle(
    #                         size=self.size,
    #                         pos=self.pos)

    self.orientation = 'vertical'
    self.spacing='10sp'
    self.add_widget(Label(text='Iniciar sesion', font_size=24))

    form = GridLayout(cols=2)

    form.add_widget(Label(text='Usuario'))
    self.username = TabTextInput(multiline=False)
    form.add_widget(self.username) #Username field
    form.add_widget(Label(text='Password'))
    self.password = TabTextInput(password=True, multiline=False) #Password field
    self.username.set_next(self.password)
    form.add_widget(self.password)
    self.add_widget(form)
    loginButton = Button(text="Conectar", size_hint_y=None, height='50sp',font_size=20)
    self.password.set_next(loginButton)
    self.add_widget(loginButton)
    loginButton.bind(on_press=partial(loginButtonOnClick,self.username,self.password)) #Accion que realizara el loginButton

def on_text(label, instance, *args):
        print 'The widget', label

def loginButtonOnClick(username, password, instance):
	print 'Validando usuario ', username.text, '...'
	req = UrlRequest(tixBaseUrl + 'bin/api/authenticate?name='+ username.text+'&password='+password.text, on_success=list_installations, on_error=requestTimeOut)
	# print(user)
	# print('Validando usuario...%s' % selfa)

def requestTimeOut(req, result):
		btnaccept = Button(text='Aceptar', size_hint_y=None, height='50sp')
		content = BoxLayout(orientation='vertical')
		content.add_widget(Label(text='Puede que el servidor de TiX no este funcionando correctamente.\nPor favor compruebe su conexion a internet y vuelva a intentarlo.'))
		content.add_widget(btnaccept)
		popup = Popup(title='Timeout Error',content=content,size_hint=(None, None), size=(600, 200), auto_dismiss=False)
		btnaccept.bind(on_press=popup.dismiss)
		popup.open()

def list_installations(req, result):
    if(result is not None and len(result) > 0):
		installations = result
		installationValues=[]
		for installation in installations:
			installationValues.append(installation['name']) 
			print installation

		print('Cantidad de instalaciones: %d' % len(installations))
		btnaccept = Button(text='Aceptar', size_hint_y=None, height='50sp')
		content = BoxLayout(orientation='vertical')
		content.add_widget(Label(text='Elija la instalacion que desea usar:'))
		spinner = Spinner(
	    text=installationValues[0],
		# available values
		values=installationValues,
		# just for positioning in our example
		size_hint=(None, None),
		size=(100, 44),
		pos_hint={'center_x': .5, 'center_y': .5})
		content.add_widget(spinner)
		content.add_widget(btnaccept)
		popup = Popup(title='Instalador',content=content,size_hint=(None, None), size=(600, 200), auto_dismiss=False)
		btnaccept.bind(on_press=partial(select_installation,spinner, popup))
		popup.open()
    else:
        print 'Usuario invalido...'
        btnclose = Button(text='Cancelar', size_hint_y=None, height='30sp')
        content = BoxLayout(orientation='vertical', spacing=10)
        btncreateinstallation = Button(text='Crear nueva instalacion', size_hint_y=None,  size_hint_x=0.4, height='50sp', pos_hint={'center_x': 0.5})
        btncreateinstallation.bind(on_press=createNewInstallationWebsite)

        content.add_widget(Label(text='El usuario que ha ingresado es invalido o no tiene instalaciones asociadas.'))
        content.add_widget(btncreateinstallation)
        content.add_widget(btnclose)
        popup = Popup(title='Error',content=content,size_hint=(None, None), size=(600, 200), auto_dismiss=False)
        btnclose.bind(on_release=popup.dismiss)
        popup.open()

def select_installation(self, popup,instance):
	print 'Elegidaaaa ', self.text
	popup.dismiss()
	return self.text

def createNewInstallationWebsite(self):
	webbrowser.open(tixBaseUrl)



class TabTextInput(TextInput):

    def __init__(self, *args, **kwargs):
        self.next = kwargs.pop('next', None)
        super(TabTextInput, self).__init__(*args, **kwargs)

    def set_next(self, next):
        self.next = next

    def _keyboard_on_key_down(self, window, keycode, text, modifiers):
        key, key_str = keycode
        if key in (9, 13) and self.next is not None:
            self.next.focus = True
            if(isinstance(self.next, TabTextInput)):
            	self.next.select_all()
        else:
            super(TabTextInput, self)._keyboard_on_key_down(window, keycode, text, modifiers)

class TiXApp(App):
 def build(self):
	return LoginScreen()

if __name__ == '__main__':
	TiXApp().run()


        # # get any files into images directory
        # curdir = dirname(__file__)
        # for filename in glob(join(curdir, 'images', '*')):
        #     try:
        #         # load the image
        #         picture = Picture(source=filename, rotation=randint(-30,30))
        #         # add to the main field
        #         root.add_widget(picture)
        #     except Exception, e:
        #         Logger.exception('Pictures: Unable to load <%s>' % filename)    
