require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut


def display
  glDepthFunc(GL_LEQUAL)
  glEnable(GL_DEPTH_TEST)
  glClearDepth(1.0)
  #Color de fondo negro
  glClearColor( 0.0, 0.0, 0.0, 0.0)
  #limpiamos la pantalla
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
  #Modo Proyeccion
  glMatrixMode (GL_PROJECTION )
  #cargamos La matriz Identidad
  glLoadIdentity
  #Proyección ortográfica dentro del cubo señalado
  # glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)

  #Modo Modelado
  #Dibujamos un triángulo

   #  glBegin(GL_QUADS);
   #  glColor3f(1, 0, 0)
   #  glVertex3f(0.4, 0.4, 0.0);
   #  glVertex3f(0.4, -0.4, 0.0);
   #  glVertex3f(-0.4, -0.4, 0.0);
   #  glVertex3f(-0.4, 0.4, 0.0);
   # glEnd();
   gluPerspective(60.0,1.0,1.0,100.0);
   glTranslatef(0.0,0.0,-2.0)
   glMatrixMode(GL_MODELVIEW)
   
   glBegin(GL_QUADS)
      glColor3f(0.0,1.0,1.0)
      glVertex3f(-0.5,0.5,-0.5)
      glVertex3f(-0.5,-0.5,0.5)
      glVertex3f(0.5,-0.5,0.5)
      glVertex3f(0.5,0.5,-0.5)
   glEnd()
   glBegin(GL_TRIANGLES)
      glColor3f(1, 0, 0)
      glVertex3f(0.0, 0.5, 0.0)
      glVertex3f(-0.7, -0.5, 0.0)
      glVertex3f(0.7, -0.5, 0.0)
   glEnd
  glFlush
  # sleep(20)
  #para evitar que el ciclo siga corriendo
end
puts ("Hola Mundo!")

glutInit
glutInitDisplayMode( GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH)
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Hola Opengl en Ruby")
glutDisplayFunc :display
glutMainLoop
