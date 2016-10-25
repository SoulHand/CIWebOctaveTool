CIWebOctaveTool
====================

Una herramienta simple para realizar grandes tareas en inteligencia artificial, crea tu set de datos, ensambla tu red neuronal y realiza tus entrenamientos de acuerdo a tus necesidades.

Uso
----------
La herramienta es de un uso portatil debes tener instalado Octave o Matlab en tu pc y acceder a la raiz del proyecto, ejecuta el comando.

```bash
	$ load init.m
	$ init
 ```
 El menu de inicio se visualizará en pantalla con las diferentes opciones a realizar.

 Establecer un vector de umbrales
 -----------------------------

 Definir los pesos en **CiWebOctaveTool** es muy facil y se puede realizar de dos maneras distintas dependiendo de la necesidad de ensamblar su red, esta las lineales para operaciones de regresión logisticas y estan las redes neuronales para operaciones no lineales.

 Si deseas crear un **vectos de umbrales lineales** solo deberas seleccionar la opción
 ```bash
	$ 5.-Reiniciar Pesos
 ```
 y establecer el numero de filas correspondientes a las entradas que va a poseer su set de datos luego la cantidad de columnas que corresponde a las salidas generadas en la red neuronal.
 ### crear un set neuronal ####
 Si deseas crear operaciones no lineales las redes neuronales son tu mejor opción para ello puedes seleccionar  la opción.
  ```bash
	$  15.-Crear set neuronal
 ```

 **Nota:** Es necesario establecer un vector de pesos al iniciar por primera vez ya que este set aplica para todas las operaciones lineales o no lineales

 Añadir set de caracteristicas Local Binary Pattern(LBP) al vector
 ------------------------------------------

 Puedes introducir manualmente tu conjunto de imagenes o introducirlas por lotes, dependiendo de tu gusto, **CIWebOctaveTool** ofrece dos opciones adecuadas para añadir set de datos de Local Binary Pattern

 Para ingresar manualmente
   ```bash
	$  1.-Añadir una imagen LBP
 ```
  Para ingresar por lotes
   ```bash
	$  13.-Añadir una estructura de imagenes
 ```
 Ambas funcionan de manera similar deberás introducir el valor de aprendizaje deseado(Y) entre valores de 0 hasta 1

 Guardar tu set de datos
 -----------------------------

 Puedes almacenar localmente la información general de todo el progreso generando un proyecto de octave con todos los datos necesarios para volver a iniciar nuevamente.

 Seleccione la siguiente opción para set de datos generales
 ```bash
	$  8.-Guardar Cambios
 ```

 Restaure su proyecto al iniciar
 -------------------------------

 Puedes cargar un set de datos ya generado o un proyecto completamente con la opción  
 ```bash
	$  7.- Importar datos
 ```
cada vez que inicie la herramienta

Calcular la función de costo
-------------------------
Permite evaluar el rendimiento de la red basado en las distancias de error que poseen los vectores de entrenamiento
 ```bash
	$  2.-Calcular Funcion de Costo
 ```
 Para redes neuronales
  ```bash
	$  16.-Calcular función de costo red neuronal
 ```
 **Nota**: Es posible que al evaluar un set de datos con regresión logistica el margen de error sea **NaN** esto representa que los valores se escapan desde **-Infinito** hasta **+Infinito**. Deberá ajustar sus datos para que el entrenamiento converga lo mas cercano posible a 0.

Exportar sus pesos a ASCII
------------------------

Si deseas exportar su progreso en el entrenamiento a otros lenguajes de programación u proyectos puede usar la opción
  ```bash
	$  9.-Exportar Pesos
	$  14.-Exportar entrenamiento
 ```

 **Nota**: CIWeb proporciona un fichero en su proyecto llamado **scriptloadW.js** que permite la generación de json adaptados a la librería **Matrix** para Javascript que puede ser usados para generar sus propios set neuronales.
