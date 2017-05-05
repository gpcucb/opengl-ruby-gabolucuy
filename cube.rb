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
  gluPerspective(60.0,1.0,1.0,100.0);
  glMatrixMode(GL_MODELVIEW)
  glTranslatef(0.0,0.0,-16.0)
  glRotatef(30.0,10.0,10.0,0)
  #cubo normal
  glPushMatrix()
    glColor3f(0.0,0.3,0.8)
    glutWireCube(5)
  glPopMatrix()
  #cubo escalado
  glPushMatrix()
    glColor3f(1.0,0,0)
    glScalef(2.0,2.0,2.0)
    glutWireCube(5)
  glPopMatrix()
  #cubo traslate
  glPushMatrix()
    glColor3f(0,1.0,0)
    glTranslatef(5,5,5)
    glutWireCube(5)
  glPopMatrix()
  #cubo rotate
  glPushMatrix()
    glColor3f(0.1,0.4,0.2)
    glRotatef(30.0,30.0,30.0,0)
    glutWireCube(5)
  glPopMatrix()
  #cubo combinado
  glPushMatrix()
    glColor3f(0.6,0.3,0.8)
    glTranslatef(5,-10,5)
    glScalef(3.0,3.0,3.0)
    glRotatef(50.0,30.0,10.0,0)
    glutWireCube(5)
  glPopMatrix()

  # glScalef(2.0,2.0,2.0)
  # glutSolidCube(1)
  # glPopMatrix()


  glFlush
   sleep(0)
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
