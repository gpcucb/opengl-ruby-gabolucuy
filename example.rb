require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

# Initialize z-buffer, projection matrix, light source, 
# and lighting model.  Do not specify a material property here.
def myinit
	ambient = [ 0.0, 0.0, 0.0, 1.0 ]
	diffuse = [ 1.0, 1.0, 1.0, 1.0 ]
	position = [ 0.0, 3.0, 2.0, 0.0 ]
	lmodel_ambient = [ 0.4, 0.4, 0.4, 1.0 ]
	local_view = [ 0.0 ]
	
	glEnable(GL_DEPTH_TEST)
	glDepthFunc(GL_LESS)
	
	glLight(GL_LIGHT0, GL_AMBIENT, ambient)
	glLight(GL_LIGHT0, GL_DIFFUSE, diffuse)
	glLight(GL_LIGHT0, GL_POSITION, position)
	glLightModel(GL_LIGHT_MODEL_AMBIENT, lmodel_ambient)
	glLightModel(GL_LIGHT_MODEL_LOCAL_VIEWER, local_view)
	
	glEnable(GL_LIGHTING)
	glEnable(GL_LIGHT0)
	
	glClearColor(0.0, 0.1, 0.1, 0.0)
end

# Draw twelve spheres in 3 rows with 4 columns.  
# The spheres in the first row have materials with no ambient reflection.
# The second row has materials with significant ambient reflection.
# The third row has materials with colored ambient reflection.
#
# The first column has materials with blue, diffuse reflection only.
# The second column has blue diffuse reflection, as well as specular
# reflection with a low shininess exponent.
# The third column has blue diffuse reflection, as well as specular
# reflection with a high shininess exponent (a more concentrated highlight).
# The fourth column has materials which also include an emissive component.
#
# glTranslatef() is used to move spheres to their appropriate locations.
display = proc do
	no_mat = [ 0.0, 0.0, 0.0, 1.0 ]
	mat_ambient = [ 0.7, 0.7, 0.7, 1.0 ]
	mat_ambient_color = [ 0.8, 0.8, 0.2, 1.0 ]
	mat_diffuse = [ 0.1, 0.5, 0.8, 1.0 ]
	mat_specular = [ 1.0, 1.0, 1.0, 1.0 ]
	no_shininess = [ 0.0 ]
	low_shininess = [ 5.0 ]
	high_shininess = [ 100.0 ]
	mat_emission = [0.3, 0.2, 0.2, 0.0]
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
	
	# draw sphere in first row, first column
	# diffuse reflection only no ambient or specular  
	glPushMatrix()
	glTranslate(-3.75, 3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, no_mat)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, no_mat)
	glMaterial(GL_FRONT, GL_SHININESS, no_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in first row, second column
	# diffuse and specular reflection low shininess no ambient
	glPushMatrix()
	glTranslate(-1.25, 3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, no_mat)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, mat_specular)
	glMaterial(GL_FRONT, GL_SHININESS, low_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in first row, third column
	# diffuse and specular reflection high shininess no ambient
	glPushMatrix()
	glTranslate(1.25, 3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, no_mat)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, mat_specular)
	glMaterial(GL_FRONT, GL_SHININESS, high_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in first row, fourth column
	# diffuse reflection emission no ambient or specular reflection
	glPushMatrix()
	glTranslate(3.75, 3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, no_mat)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, no_mat)
	glMaterial(GL_FRONT, GL_SHININESS, no_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, mat_emission)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in second row, first column
	# ambient and diffuse reflection no specular  
	glPushMatrix()
	glTranslate(-3.75, 0.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, no_mat)
	glMaterial(GL_FRONT, GL_SHININESS, no_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in second row, second column
	# ambient, diffuse and specular reflection low shininess
	glPushMatrix()
	glTranslate(-1.25, 0.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, mat_specular)
	glMaterial(GL_FRONT, GL_SHININESS, low_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in second row, third column
	# ambient, diffuse and specular reflection high shininess
	glPushMatrix()
	glTranslate(1.25, 0.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, mat_specular)
	glMaterial(GL_FRONT, GL_SHININESS, high_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in second row, fourth column
	# ambient and diffuse reflection emission no specular
	glPushMatrix()
	glTranslate(3.75, 0.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, no_mat)
	glMaterial(GL_FRONT, GL_SHININESS, no_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, mat_emission)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in third row, first column
	# colored ambient and diffuse reflection no specular  
	glPushMatrix()
	glTranslate(-3.75, -3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient_color)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, no_mat)
	glMaterial(GL_FRONT, GL_SHININESS, no_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in third row, second column
	# colored ambient, diffuse and specular reflection low shininess
	glPushMatrix()
	glTranslate(-1.25, -3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient_color)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, mat_specular)
	glMaterial(GL_FRONT, GL_SHININESS, low_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in third row, third column
	# colored ambient, diffuse and specular reflection high shininess
	glPushMatrix()
	glTranslate(1.25, -3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient_color)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, mat_specular)
	glMaterial(GL_FRONT, GL_SHININESS, high_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, no_mat)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	# draw sphere in third row, fourth column
	# colored ambient and diffuse reflection emission no specular
	glPushMatrix()
	glTranslate(3.75, -3.0, 0.0)
	glMaterial(GL_FRONT, GL_AMBIENT, mat_ambient_color)
	glMaterial(GL_FRONT, GL_DIFFUSE, mat_diffuse)
	glMaterial(GL_FRONT, GL_SPECULAR, no_mat)
	glMaterial(GL_FRONT, GL_SHININESS, no_shininess)
	glMaterial(GL_FRONT, GL_EMISSION, mat_emission)
	glutSolidSphere(1.0, 16, 16)
	glPopMatrix()
	
	glutSwapBuffers()
end

myReshape = proc do |w, h|
	glViewport(0, 0, w, h)
	glMatrixMode(GL_PROJECTION)
	glLoadIdentity()
	if (w <= (h * 2))
		glOrtho(-6.0, 6.0, -3.0*(h.to_f*2)/w,	3.0*(h.to_f*2)/w, -10.0, 10.0)
	else
		glOrtho(-6.0*w.to_f/(h*2), 6.0*w.to_f/(h*2), -3.0, 3.0, -10.0, 10.0)
	end
	glMatrixMode(GL_MODELVIEW)
end

keyboard = Proc.new do |key, x, y|
	case (key)
		when ?\e
		exit(0);
	end
end

# Main Loop
# Open window with initial window size, title bar, 
# RGBA display mode, and handle input events.
glutInit()
glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH)
glutInitWindowSize(600, 600)
glutInitWindowPosition(100, 100)
glutCreateWindow()
myinit()
glutReshapeFunc(myReshape)
glutDisplayFunc(display)
glutKeyboardFunc(keyboard)
glutMainLoop()