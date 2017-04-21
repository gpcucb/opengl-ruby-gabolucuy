require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut


def display
  #Color de fondo negro
  glClearColor( 0.0, 0.0, 0.0, 0.0)
  #limpiamos la pantalla
  glClear(GL_COLOR_BUFFER_BIT)
  #Modo Proyeccion
  glMatrixMode (GL_PROJECTION )
  #cargamos La matriz Identidad
  glLoadIdentity
  #Proyección ortográfica dentro del cubo señalado
  glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)

  #Modo Modelado
  glMatrixMode(GL_MODELVIEW)
  #Dibujamos un triángulo
  # glBegin(GL_TRIANGLES)
  # glColor3f(1, 0, 0)
  # glVertex3f(0.0, 0.8, 0.0)
  # glColor3f(0.0, 1.0, 0)
  # glVertex3f(-0.6, -0.2, 0.0)
  # glColor3f(0, 0, 1.0)
  # glVertex3f(0.6, -0.2, 0.0)
  # glEnd
  glBegin(GL_QUADS);
  glColor3f(1, 0, 0)
  glVertex3f(0.4, 0.4, 0.0);
  glVertex3f(0.4, -0.4, 0.0);
  glVertex3f(-0.4, -0.4, 0.0);
  glVertex3f(-0.4, 0.4, 0.0);
 glEnd();
  glFlush
  #para evitar que el ciclo siga corriendo
  glutPostRedisplay
end
puts ("Hola Mundo!")

glutInit
glutInitDisplayMode( GLUT_SINGLE || GLUT_RGBA)
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Hola Opengl en Ruby")
glutDisplayFunc :display
glutMainLoop
